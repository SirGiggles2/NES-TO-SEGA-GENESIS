param(
    [Parameter(Mandatory = $true)][string]$ExePath,
    [Parameter(Mandatory = $true)][string[]]$ExeArgs,
    [Parameter(Mandatory = $true)][string]$OutputDir,
    [Parameter(Mandatory = $true)][string]$Prefix,
    [int]$DurationSec,
    [int]$IntervalMs
)

$ErrorActionPreference = "Stop"

if (-not $DurationSec) { $DurationSec = 95 }
if (-not $IntervalMs) { $IntervalMs = 250 }

Add-Type -AssemblyName System.Drawing

$signature = @"
using System;
using System.Runtime.InteropServices;
public static class Win32 {
  [StructLayout(LayoutKind.Sequential)]
  public struct RECT { public int Left; public int Top; public int Right; public int Bottom; }
  [StructLayout(LayoutKind.Sequential)]
  public struct POINT { public int X; public int Y; }
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);
  [DllImport("user32.dll")] public static extern bool GetClientRect(IntPtr hWnd, out RECT rect);
  [DllImport("user32.dll")] public static extern bool ClientToScreen(IntPtr hWnd, ref POINT point);
  [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr hWnd);
  [DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
}
"@
Add-Type -TypeDefinition $signature -ErrorAction SilentlyContinue | Out-Null

if (-not (Test-Path $ExePath)) { throw "Executable not found: $ExePath" }
if (-not (Test-Path $OutputDir)) { New-Item -ItemType Directory -Path $OutputDir | Out-Null }

# Build a robust command-line string with explicit quoting for args containing spaces.
$quotedArgs = @()
foreach ($arg in $ExeArgs) {
    if ($null -eq $arg) { continue }
    $s = [string]$arg
    if ($s.Contains('"')) { $s = $s.Replace('"', '\"') }
    if ($s -match '\s') { $s = '"' + $s + '"' }
    $quotedArgs += $s
}
$argLine = ($quotedArgs -join ' ')
$proc = Start-Process -FilePath $ExePath -ArgumentList $argLine -PassThru

$deadline = (Get-Date).AddSeconds(20)
$hWnd = [IntPtr]::Zero
while ((Get-Date) -lt $deadline) {
    Start-Sleep -Milliseconds 250
    $proc.Refresh()
    if ($proc.HasExited) { throw "Process exited before window became available." }
    if ($proc.MainWindowHandle -ne 0) {
        $hWnd = [IntPtr]$proc.MainWindowHandle
        break
    }
}
if ($hWnd -eq [IntPtr]::Zero) { throw "Could not obtain emulator window handle." }
[void][Win32]::ShowWindow($hWnd, 5)            # SW_SHOW
[void][Win32]::SetForegroundWindow($hWnd)
Start-Sleep -Milliseconds 300

$start = Get-Date
$i = 0
while (((Get-Date) - $start).TotalSeconds -lt $DurationSec) {
    $i++
    $client = New-Object Win32+RECT
    [void][Win32]::GetClientRect($hWnd, [ref]$client)
    $pt = New-Object Win32+POINT
    $pt.X = 0
    $pt.Y = 0
    [void][Win32]::ClientToScreen($hWnd, [ref]$pt)
    $width = $client.Right - $client.Left
    $height = $client.Bottom - $client.Top

    if ($width -gt 64 -and $height -gt 64) {
        $bmp = New-Object System.Drawing.Bitmap($width, $height)
        $g = [System.Drawing.Graphics]::FromImage($bmp)
        $g.CopyFromScreen($pt.X, $pt.Y, 0, 0, $bmp.Size)
        $name = "{0}_{1:D5}.png" -f $Prefix, $i
        $path = Join-Path $OutputDir $name
        $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
        $g.Dispose()
        $bmp.Dispose()
    }

    Start-Sleep -Milliseconds $IntervalMs
    $proc.Refresh()
    if ($proc.HasExited) { break }
}

if (-not $proc.HasExited) {
    $null = $proc.CloseMainWindow()
    Start-Sleep -Seconds 2
    $proc.Refresh()
    if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
}

Write-Output ("Captured frames to: {0}" -f $OutputDir)
