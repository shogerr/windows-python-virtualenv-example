Param (
  $PythonDownloadURL = "https://github.com/winpython/winpython/releases/download/2.1.20190928/Winpython64-3.7.4.1Zero.exe",
  $OutPath           = "third_party"
)

if (!(Test-Path $OutPath)) {
  mkdir -Force "$OutPath/python" | Out-Null
}

# Perform an http GET for the file.
$result      = Invoke-WebRequest -method GET -Uri $PythonDownloadURL -Headers $resourceHeaders

# Determine the file name to use.
$outFilePath = "$PWD\"+$OutPath+"\"+$result.Headers.'Content-Disposition'.Split("=")[1]

#
# Download WinPython
#
Write-Progress -Activity "Configuring Python" -CurrentOperation "Downloading Python" -Status "0% Complete:" -PercentComplete 0

[System.IO.File]::WriteAllBytes($outFilePath, $result.content)

Write-Progress -Activity "Configuring Python" -CurrentOperation "Unpacking Python" -Status "50% Complete:" -PercentComplete 50 

& $outFilePath -bso0 -bsp0 -y -o"$OutPath/python" "$outFilePath" | Out-Null

Write-Progress -Activity "Configuring Python" -CurrentOperation "Finding Python Path" -Status "75% Complete:" -PercentComplete 75 

#
# Resolve path to python.
#
$result = (Get-ChildItem -Path "$OutPath/python" -Recurse -Include python.exe | Where-Object { (Split-Path $_.Directory -Leaf) -match 64 }).FullName

Write-Progress -Activity "Unpacking Python" -Status "100% Compete" -Completed

# Return a path to python.
return "$result"

