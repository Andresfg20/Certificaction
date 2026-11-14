# Compila, ejecuta y prueba todos los proyectos (Windows PowerShell).
# Requisito: haber ejecutado <ruta>\cangjie\envsetup.ps1 en esta sesión o tener CANGJIE_HOME en el PATH.
$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$Raiz = Split-Path -Parent $PSScriptRoot
$Cod = Join-Path $Raiz "certification\codigo"

function Invoke-Paso([string]$Comando) {
    Invoke-Expression $Comando
    if ($LASTEXITCODE -ne 0) { throw "Falló: $Comando (código $LASTEXITCODE)" }
}

if (-not (Get-Command cjc -ErrorAction SilentlyContinue)) {
    throw "cjc no está en el PATH. Ejecuta: . <ruta>\cangjie\envsetup.ps1"
}
Invoke-Paso "cjc -v"

Write-Host "==> proyecto-1/hola-cjc (cjc)"
Push-Location (Join-Path $Cod "proyecto-1\hola-cjc")
try {
    Invoke-Paso "cjc main.cj -o hola.exe"
    Invoke-Paso ".\hola.exe"
    Remove-Item hola.exe -ErrorAction SilentlyContinue
} finally { Pop-Location }

# Proyecto y entrada simulada para los programas que leen de la consola
$Proyectos = [ordered]@{
    "proyecto-1\cjpmDemo"                = ""
    "proyecto-1\cangjie"                 = ""
    "proyecto-2\tarea-2-1-consola"       = "Corhuila`n12`n35.5`nyes"
    "proyecto-2\tarea-2-2-guardar-logs"  = "1`n2`n3`n4`n5"
    "proyecto-2\tarea-2-3-filtrar-logs"  = "3`n5`n6"
    "proyecto-3\tarea-3-1-validacion" = "abc`n999`n1005`nBogota`nHaidian"
    "proyecto-3\tarea-3-2-gestion-dispositivos" = "2`n1001`nHaidian`n2`n1002`nXicheng`n1`n4`n1002`nChaoyang`n5`nChaoyang`n3`n1001`n1`n6"
    "proyecto-3\tarea-3-3-analisis-csv" = "1`n2`n3`n4"
    "proyecto-3\tarea-3-4-funcional" = "1`n2`n3`n4"
    "proyecto-4\tarea-4-1-aire-acondicionado" = "1`n1`n3`n30`n`n3`n22`n4`n5`n2`n10003`nOffice AC`n`n3`n3`n`n4"
    "proyecto-4\tarea-4-2-dispositivos" = "1`n2`n3`n2`n2`n4`n3`n2`n`n3`n4"
    "proyecto-4\tarea-4-3-habitaciones" = "1`n2`n3`n22`n4`n5`n4`n3`n5`n3"
}
foreach ($p in $Proyectos.Keys) {
    Write-Host "==> $p"
    Push-Location (Join-Path $Cod $p)
    try {
        if (Test-Path "ffi\program.c") {
            $cc = @("clang", "gcc") | Where-Object { Get-Command $_ -ErrorAction SilentlyContinue } | Select-Object -First 1
            if (-not $cc) {
                Write-Warning "Se omite $p: necesita un compilador de C (clang o gcc) para ffi\program.c"
                continue
            }
            Invoke-Paso "$cc -c ffi\program.c -o ffi\program.o"
        }
        Invoke-Paso "cjpm build"
        $entrada = $Proyectos[$p]
        $entrada | cjpm run
        if ($LASTEXITCODE -ne 0) { throw "Falló: cjpm run en $p" }
        Invoke-Paso "cjpm test"
    } finally { Pop-Location }
}
Write-Host "Todos los proyectos compilaron, ejecutaron y pasaron sus pruebas."
