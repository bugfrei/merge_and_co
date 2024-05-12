del .git -re -fo
del * -Exclude reset.ps1, readme.md, pics
"console.log('Programmstart');" >file.js
git init
git a
git c "Initial"

# Code Basis
"`nfor(var i = 0; i < 10; i++) {`n    console.log(i);`n}" >>file.js

git ac "Schleife"
#git tag "schleife"

# Config
"1" > config.txt
git a
git c "Config added"

git branch fix
git checkout fix


# 1. Änderung

"`nfunction hello() {`n    console.log(`"Hello World!`");`n}" >>file.js
git ac "hello function"
git tag squashdest

# Config Änderung
"2" > config.txt
git ac "Config changed"
git tag "cfg"

# 2. Änderung

$c = (Get-Content file.js -Raw).Replace("i < 10", "i < 20");
Write-Host $c -ForegroundColor Green
Set-Content -Path file.js -Value $c -Force
git ac "count to 20"
git tag "schleife"

# 3. Änderung

$c = (Get-Content file.js -Raw).Replace("hello()", "hello(i)");
$c = $c.Replace("`"Hello World!`"", "``Number `${i}``")
Write-Host $c -ForegroundColor Green
Set-Content -Path file.js -Value $c -Force
git ac "hello function changed"

# 4. Änderung
$c = (Get-Content file.js -Raw).Replace("console.log(i);", "hello(i);");
Write-Host $c -ForegroundColor Green
Set-Content -Path file.js -Value $c -Force
git ac "hello function call"

git checkout main
git checkout schleife
git branch feature
git checkout feature

$c = (Get-Content file.js -Raw).Replace("i < 20", "i < 30");
Write-Host $c -ForegroundColor Green
Set-Content -Path file.js -Value $c -Force
git ac "count to 30"


git checkout main
# Noch eine Änderung damit es kein Fast Forward gibt
# $c = (Get-Content file.js -Raw).Replace("Programmstart", "Start des Programms")
# Set-Content -Path file.js -Value $c -Force
# git ac "Kommentar"

"NocheineFile" >file2.txt
git a
git c "Noch ein File"

git log --oneline --graph --all
Write-Host "Reseted" -ForegroundColor Green

