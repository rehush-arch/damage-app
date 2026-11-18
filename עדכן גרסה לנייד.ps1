# Copies the latest app into this folder as index.html (run after changing the app, then re-upload the folder).
# The app is the .html file in the parent folder that does not have "(" in its name (the backup does).
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$app = Get-ChildItem -LiteralPath (Split-Path -Parent $here) -Filter '*.html' | Where-Object { $_.Name -notlike '*(*' } | Select-Object -First 1
Copy-Item -LiteralPath $app.FullName -Destination (Join-Path $here 'index.html') -Force
Write-Host ('index.html updated from ' + $app.Name)
