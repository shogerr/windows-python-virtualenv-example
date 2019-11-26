Param ($OutPath = "third_party")

if (Test-Path ./.venv) {
  Write-Host "Cleaning existing Virtualenv (.venv).." -ForegroundColor Magenta
  rm -r -fo .venv
}

Write-Host "Installing Virtualenv.." -ForegroundColor Magenta

pip install -U pip
pip install --user virtualenv

if (Test-Path $OutPath) { rm -r -fo $OutPath }

Write-Host "Downloading portable Python.." -ForegroundColor Magenta

$pythonPath = .\download-python.ps1 -OutPath $OutPath

Write-Host "Creating a Virtualenv.." -ForegroundColor Magenta

python -m virtualenv --python="$pythonPath" .venv

Write-Host "Activating Virtualenv.." -ForegroundColor Magenta

. .\.venv\Scripts\activate

Write-Host "Installing pip packages.." -ForegroundColor Magenta

python -m pip install -r requirements.txt

deactivate

Write-Host "`nTo activate environmentn:`n" -ForegroundColor Yellow
Write-Host " . .\.venv\Scripts\activate`n" -ForegroundColor Cyan

Write-Host "`nTo re-install pip packages:`n" -ForegroundColor Yellow
Write-Host " pip install -r requirements.txt`n" -ForegroundColor Cyan

