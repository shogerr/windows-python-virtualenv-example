Param ($OutPath = "third_party")

Write-Host "Installing Virtualenv.." -ForegroundColor Magenta

pip install -U pip
pip install --user virtualenv

if (Test-Path $OutPath) { rm -r -fo $OutPath }

Write-Host "Downloading portable Python.." -ForegroundColor Magenta

$pythonPath = .\download-python.ps1 -OutPath $OutPath

Write-Host "Creating a Virtualenv.." -ForegroundColor Magenta

python -m virtualenv --python="$pythonPath" .venv

Write-Host "`nTo complete installation, run:`n"
Write-Host " . .\.venv\Scripts\activate" -ForegroundColor Cyan
Write-Host " pip install -r requirements.txt`n" -ForegroundColor Cyan

