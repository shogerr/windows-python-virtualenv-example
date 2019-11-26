Param (
  $PythonDownloadURL = "https://www.python.org/ftp/python",
  $OutPath = "third_party",
  $Version = "3.7.5"
)

$filename = "python-{0}-embed-amd64.zip" -f $Version

Invoke-WebRequest -Uri $PythonDownloadURL/$Version/$filename -OutFile $OutPath\$filename

Expand-Archive -Path $OutPath\$filename -DestinationPath $OutPath\python$("$Version" -replace '\.','')
