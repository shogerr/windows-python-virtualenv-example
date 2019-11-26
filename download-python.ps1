Param (
  $PythonDownloadURL = "https://github.com/winpython/winpython/releases/download/2.1.20190928/Winpython64-3.7.4.1Zero.exe",
  $OutPath = "third_party"
)

if (!(Test-Path $OutPath)) {
  mkdir $OutPath
}

$result = Invoke-WebRequest -method GET -Uri $PythonDownloadURL -Headers $resourceHeaders -Verbose

$outFilename = ".\"+$OutPath+"\"+$result.Headers.'Content-Disposition'.Split("=")[1]

$outFilename

$result.Headers.'Content-Disposition'.Split('=')[1]

[System.IO.File]::WriteAllBytes($outFilename, $result.content)

7z x -o"$OutPath" $outFilename

#Expand-Archive -Path $OutPath\$filename -DestinationPath $OutPath\python$("$Version" -replace '\.','')
