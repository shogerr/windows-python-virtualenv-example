Param (
  $PythonDownloadURL = "https://github.com/winpython/winpython/releases/download/2.1.20190928/Winpython64-3.7.4.1Zero.exe",
  $OutPath           = "third_party"
)

if (!(Test-Path $OutPath)) {
  mkdir $OutPath | Out-Null
}

$result = Invoke-WebRequest -method GET -Uri $PythonDownloadURL -Headers $resourceHeaders

$outFilePath = "$PWD\"+$OutPath+"\"+$result.Headers.'Content-Disposition'.Split("=")[1]

Write-Progress -Activity "Unpacking Python" -Status "0% Complete:" -PercentComplete 0

[System.IO.File]::WriteAllBytes($outFilePath, $result.content)

Write-Progress -Activity "Unpacking Python" -Status "50% Complete:" -PercentComplete 50 

7z x -o"$OutPath" -bso0 -bsp0 -y $outFilePath

Write-Progress -Activity "Unpacking Python" -Status "100% Compete" -Completed

$pythonPath = ((& 7z l $outFilePath | where-object {$_ -match "64\\python.exe"}) -split '\s+?\b')[3]

$result = "$PWD\$OutPath\$pythonPath"
Write-Host $result
return $result

