$pythonPath = ""
if (Test-Path "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe") {
    $pythonPath = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
} elseif (Test-Path "$env:LOCALAPPDATA\Programs\Python\Python312\python.exe") {
    $pythonPath = "$env:LOCALAPPDATA\Programs\Python\Python312\python.exe"
} else {
    $pythonPath = "C:\Python312\python.exe"
}
& $pythonPath gen_tables.py
