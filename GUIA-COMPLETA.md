# Guía completa · Certificación Cangjie Programming (Huawei ICT Academy)

> Todo lo de esta guía ya está creado en la carpeta `LISTO-PARA-REPO/`. Copia **su contenido** (incluidos los archivos ocultos `.github`, `.gitignore`, etc.) a la raíz de tu repositorio, al mismo nivel que `01-week … 16-week`.

# Resumen del Proyecto

Repositorio de evidencias de la certificación **Cangjie Programming** (Huawei Talent · ICT Academy, 56 h) para el Corte 3 de Programación Móvil. La carpeta `certification/` vive en la raíz del repositorio y contiene el README con la ficha y el avance, el certificado, las capturas de evidencia y el código de los 4 proyectos del curso:

| Proyecto | Paquete cjpm | Contenido |
|---|---|---|
| 1 · Setting Up The Work Environment | `hola-cjc`, `cjpmDemo`, `cangjie` | Tu código original (cjc vs cjpm) + prueba unitaria añadida a `cjpmDemo`. |
| 2 · Log File Management | `tarea_2_1_consola`, `tarea_2_2_guardar_logs`, `tarea_2_3_filtrar_logs` | **Tu código del curso**: log por consola, guardado en `log.txt` con `try` con recursos, filtrado por nivel con sobrecarga y lambda final. |
| 3 · System Data Analysis | `tarea_3_1_validacion`, `tarea_3_2_gestion_dispositivos`, `tarea_3_3_analisis_csv`, `tarea_3_4_funcional` | **Tu código del curso**: `enum` + `match`, `Option`, CRUD con `ArrayList`/`HashSet`, análisis del CSV de ventas y *pipeline* funcional con `\|>`. |
| 4 · Business Function Optimization | `task4_1`, `task4_2`, `task4_3` | **Tu código del curso**: clases con `prop`, singleton, herencia, interfaces, polimorfismo, genéricos con restricciones y FFI a C. |

**Supuestos tomados**
1. Lenguaje: **Cangjie** (SDK 1.2.1 instalado y validado en tu equipo) (detectado por `cjpm.toml`, `.cj` y la captura de Huawei Talent). Versión `cjc-version = "1.2.0"`, la de tu `cjpm.toml`.
2. Los proyectos 1–4 son tu código real del curso (terminado el 13-nov-2026). Solo se corrigió lo necesario para compilar con el SDK 1.2.1; cada README de proyecto lista los ajustes.
3. Evidencias y `certificado.pdf` salen de tu cuenta de Huawei Talent (código de certificado `ICT20261114000013`).
4. Archivos de otros ecosistemas (`package.json`, `requirements.txt`, `pom.xml`, `build.gradle`, `.env.example`) **no aplican**: Cangjie usa `cjpm.toml` y no hay secretos ni variables de configuración. Crearlos sería ruido y confundiría al evaluador.
5. Docker es opcional y está en `tools/docker/` para no ensuciar la raíz del repositorio semanal.

# Tecnologías Detectadas

| Elemento | Valor |
|---|---|
| Lenguaje | Cangjie (Huawei) |
| SDK | Cangjie SDK 1.x (cjc 1.2.0 en tu equipo) |
| Gestor de proyectos / build / test | `cjpm` (`cjpm.toml`) |
| Compilador | `cjc` |
| Pruebas | `std.unittest` + `std.unittest.testmacro` (`@Test`, `@TestCase`, `@Expect`, `@ExpectThrows`) |
| Librerías estándar usadas | `std.collection` (ArrayList, HashMap, HashSet), `std.math`, `std.convert` |
| Dependencias externas | Ninguna |
| IDE | VS Code + extensión Cangjie, o DevEco Studio + DevEco-Cangjie-Plugin |
| CI | GitHub Actions + acción `Zxilly/setup-cangjie@v3` |
| Contenedor (opcional) | Docker, Ubuntu 22.04 |

# Estructura Completa del Repositorio

```text
<tu-repo>/
├── 01-week/ … 16-week/          (ya existentes)
├── .github/workflows/certification-ci.yml
├── .vscode/extensions.json
├── .vscode/settings.json
├── .dockerignore
├── .editorconfig
├── .gitattributes
├── .gitignore
├── scripts/
│   ├── validar-certificacion.sh
│   ├── probar-todo.sh
│   └── probar-todo.ps1
├── tools/docker/
│   ├── Dockerfile
│   └── docker-compose.yml
└── certification/
    ├── README.md
    ├── certificado.pdf               (incluido)
    ├── evidencias/
    │   ├── 00-ficha-del-curso.png    (incluido)
    │   ├── 01-proyecto-1.png         (incluido)
    │   ├── 02-proyecto-2.png         (incluido)
    │   ├── 03-proyecto-3.png         (incluido)
    │   ├── 04-proyecto-4.png         (incluido)
    │   └── 05-examen-final.png       (incluido)
    └── codigo/
        ├── proyecto-1/ (README.md, hola-cjc/main.cj, cjpmDemo/, cangjie/)
        ├── proyecto-2/ (README.md, tarea-2-1-consola/, tarea-2-2-guardar-logs/, tarea-2-3-filtrar-logs/ + log.txt)
        ├── proyecto-3/ (README.md, tarea-3-1-validacion/, tarea-3-2-gestion-dispositivos/, tarea-3-3-analisis-csv/ + CSV, tarea-3-4-funcional/ + CSV)
        └── proyecto-4/ (README.md, tarea-4-1-aire-acondicionado/, tarea-4-2-dispositivos/, tarea-4-3-habitaciones/; cada una con ffi/program.c)
```

> Si ya tienes un `.gitignore` o `.gitattributes` en la raíz, **combina** el contenido en vez de reemplazarlo.

# Contenido Completo de Cada Archivo

## `.gitignore`

```text
# ---- Cangjie / cjpm ----
target/
**/target/
*.cjo
*.bc
*.o
*.obj
*.ll
cjpm.lock.bak
.cache/

# Binarios compilados con cjc
certification/codigo/proyecto-1/hola-cjc/hola
certification/codigo/proyecto-1/hola-cjc/main
*.exe
*.out
*.dll
*.so
*.dylib

# SDK descargado localmente (para Docker)
.sdk/
cangjie-sdk-*.tar.gz
cangjie-sdk-*.zip

# ---- Sistema operativo ----
.DS_Store
__MACOSX/
._*
Thumbs.db
desktop.ini

# ---- Editores ----
.idea/
*.swp
*~
.vscode/*
!.vscode/extensions.json
!.vscode/settings.json

# ---- Variables de entorno ----
.env
.env.*
!.env.example

# Log generado al ejecutar la tarea 2.2
certification/codigo/proyecto-2/tarea-2-2-guardar-logs/log.txt
```

## `.gitattributes`

```text
* text=auto eol=lf
*.cj text eol=lf
*.toml text eol=lf
*.md text eol=lf
*.sh text eol=lf
*.yml text eol=lf
*.ps1 text eol=crlf
*.png binary
*.jpg binary
*.pdf binary
```

## `.editorconfig`

```text
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
indent_style = space
indent_size = 4

[*.{yml,yaml,json,md}]
indent_size = 2

[*.md]
trim_trailing_whitespace = false

[*.ps1]
end_of_line = crlf
```

## `.dockerignore`

```text
.git
**/target
certification/evidencias
certification/certificado.pdf
```

## `.vscode/extensions.json`

```json
{
  "recommendations": [
    "editorconfig.editorconfig",
    "github.vscode-github-actions",
    "eamodio.gitlens",
    "davidanson.vscode-markdownlint",
    "yzhang.markdown-all-in-one"
  ]
}
```

## `.vscode/settings.json`

```json
{
  "files.eol": "\n",
  "files.encoding": "utf8",
  "files.insertFinalNewline": true,
  "files.trimTrailingWhitespace": true,
  "files.exclude": {
    "**/target": true,
    "**/.DS_Store": true
  }
}
```

## `.github/workflows/certification-ci.yml`

```yaml
name: Certificación Cangjie CI

on:
  push:
    branches: [main]
    paths:
      - "certification/**"
      - "scripts/**"
      - ".github/workflows/certification-ci.yml"
  pull_request:
    paths:
      - "certification/**"
  workflow_dispatch:
    inputs:
      strict:
        description: "Exigir evidencias y certificado (entrega final)"
        type: boolean
        default: false

permissions:
  contents: read

jobs:
  estructura:
    name: Validar estructura
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Validar certification/
        env:
          STRICT: ${{ inputs.strict && '1' || '0' }}
        run: bash scripts/validar-certificacion.sh

  compilar:
    name: Build, run y test · ${{ matrix.proyecto }}
    needs: estructura
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        include:
          - proyecto: proyecto-1/cjpmDemo
            entrada: ""
          - proyecto: proyecto-1/cangjie
            entrada: ""
          - proyecto: proyecto-2/tarea-2-1-consola
            entrada: 'Corhuila\n12\n35.5\nyes\n'
          - proyecto: proyecto-2/tarea-2-2-guardar-logs
            entrada: '1\n2\n3\n4\n5\n'
          - proyecto: proyecto-2/tarea-2-3-filtrar-logs
            entrada: '3\n5\n6\n'
          - proyecto: proyecto-3/tarea-3-1-validacion
            entrada: 'abc\n999\n1005\nBogota\nHaidian\n'
          - proyecto: proyecto-3/tarea-3-2-gestion-dispositivos
            entrada: '2\n1001\nHaidian\n2\n1002\nXicheng\n1\n4\n1002\nChaoyang\n5\nChaoyang\n3\n1001\n1\n6\n'
          - proyecto: proyecto-3/tarea-3-3-analisis-csv
            entrada: '1\n2\n3\n4\n'
          - proyecto: proyecto-3/tarea-3-4-funcional
            entrada: '1\n2\n3\n4\n'
          - proyecto: proyecto-4/tarea-4-1-aire-acondicionado
            entrada: '1\n1\n3\n30\n\n3\n22\n4\n5\n2\n10003\nOffice AC\n\n3\n3\n\n4\n'
          - proyecto: proyecto-4/tarea-4-2-dispositivos
            entrada: '1\n2\n3\n2\n2\n4\n3\n2\n\n3\n4\n'
          - proyecto: proyecto-4/tarea-4-3-habitaciones
            entrada: '1\n2\n3\n22\n4\n5\n4\n3\n5\n3\n'
    env:
      TERM: dumb
    defaults:
      run:
        working-directory: certification/codigo/${{ matrix.proyecto }}
    steps:
      - uses: actions/checkout@v4

      # SDK 1.2.1 (STS), la misma versión validada localmente; si falla, usa la última LTS.
      - name: Instalar Cangjie SDK (STS)
        id: sts
        continue-on-error: true
        uses: Zxilly/setup-cangjie@v3
        with:
          channel: sts
          version: 1.2.1
      - name: Instalar Cangjie SDK (LTS, respaldo)
        if: steps.sts.outcome == 'failure'
        uses: Zxilly/setup-cangjie@v3
        with:
          channel: lts
          version: latest

      - name: Alinear cjc-version con el SDK instalado (solo en CI)
        run: |
          cjc -v
          CJV="$(cjc -v | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)"
          sed -i "s/cjc-version = \".*\"/cjc-version = \"${CJV}\"/" cjpm.toml
          grep cjc-version cjpm.toml

      - name: Compilar código C para FFI (proyecto 4)
        run: |
          if [ -f ffi/program.c ]; then cc -c ffi/program.c -o ffi/program.o; fi

      - name: Build
        run: cjpm build
      - name: Run (con entrada simulada para los programas interactivos)
        run: printf '${{ matrix.entrada }}' | timeout 120 cjpm run
      - name: Test
        run: cjpm test

  hola-cjc:
    name: Compilar con cjc · proyecto-1/hola-cjc
    needs: estructura
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Instalar Cangjie SDK (STS)
        id: sts
        continue-on-error: true
        uses: Zxilly/setup-cangjie@v3
        with:
          channel: sts
          version: 1.2.1
      - name: Instalar Cangjie SDK (LTS, respaldo)
        if: steps.sts.outcome == 'failure'
        uses: Zxilly/setup-cangjie@v3
        with:
          channel: lts
          version: latest
      - name: Compilar y ejecutar
        working-directory: certification/codigo/proyecto-1/hola-cjc
        run: |
          cjc main.cj -o hola
          ./hola | tee salida.txt
          grep -q "Hello Cangjie" salida.txt
```

## `scripts/validar-certificacion.sh`

```bash
#!/usr/bin/env bash
# Valida la estructura obligatoria de certification/.
# STRICT=1 convierte en error la falta de evidencias o del certificado (entrega final).
set -u
RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
C="$RAIZ/certification"
STRICT="${STRICT:-0}"
errores=0
avisos=0

ok()    { echo "  [OK]    $1"; }
falta() { echo "  [ERROR] Falta: $1"; errores=$((errores + 1)); }
aviso() { echo "  [AVISO] Pendiente: $1"; avisos=$((avisos + 1)); }

echo "== Estructura base =="
[ -d "$C" ] && ok "certification/" || { falta "certification/ en la raíz del repositorio"; exit 1; }
[ -f "$C/README.md" ] && ok "README.md" || falta "certification/README.md"

echo "== Proyectos de código =="
for p in proyecto-1 proyecto-2 proyecto-3 proyecto-4; do
  if [ -d "$C/codigo/$p" ] && [ -n "$(ls -A "$C/codigo/$p" 2>/dev/null)" ]; then ok "codigo/$p"; else falta "codigo/$p (con contenido)"; fi
done
for t in proyecto-1/cjpmDemo proyecto-1/cangjie proyecto-2/tarea-2-1-consola proyecto-2/tarea-2-2-guardar-logs proyecto-2/tarea-2-3-filtrar-logs proyecto-3/tarea-3-1-validacion proyecto-3/tarea-3-2-gestion-dispositivos proyecto-3/tarea-3-3-analisis-csv proyecto-3/tarea-3-4-funcional proyecto-4/tarea-4-1-aire-acondicionado proyecto-4/tarea-4-2-dispositivos proyecto-4/tarea-4-3-habitaciones; do
  [ -f "$C/codigo/$t/cjpm.toml" ] && ok "codigo/$t/cjpm.toml" || falta "codigo/$t/cjpm.toml"
  [ -f "$C/codigo/$t/src/main.cj" ] && ok "codigo/$t/src/main.cj" || falta "codigo/$t/src/main.cj"
done
[ -f "$C/codigo/proyecto-1/hola-cjc/main.cj" ] && ok "codigo/proyecto-1/hola-cjc/main.cj" || falta "codigo/proyecto-1/hola-cjc/main.cj"

echo "== Evidencias y certificado =="
pendiente() { if [ "$STRICT" = "1" ]; then falta "$1"; else aviso "$1"; fi; }
for e in 00-ficha-del-curso 01-proyecto-1 02-proyecto-2 03-proyecto-3 04-proyecto-4 05-examen-final; do
  [ -s "$C/evidencias/$e.png" ] && ok "evidencias/$e.png" || pendiente "evidencias/$e.png"
done
[ -s "$C/certificado.pdf" ] && ok "certificado.pdf" || pendiente "certificado.pdf"

echo "== Archivos que no deben subirse =="
# target/ y binarios ya los excluye .gitignore; aquí solo se buscan restos de macOS.
basura="$(find "$C" \( -name '.DS_Store' -o -name '__MACOSX' -o -name '._*' \) 2>/dev/null)"
if [ -n "$basura" ]; then echo "$basura" | sed 's/^/  [ERROR] No versionar: /'; errores=$((errores + 1)); else ok "sin .DS_Store ni __MACOSX"; fi

echo
echo "Resultado: $errores error(es), $avisos pendiente(s)."
[ "$errores" -eq 0 ]
```

## `scripts/probar-todo.sh`

```bash
#!/usr/bin/env bash
# Compila, ejecuta y prueba todos los proyectos de certification/codigo.
set -euo pipefail
RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
COD="$RAIZ/certification/codigo"

command -v cjc  >/dev/null || { echo "cjc no está en el PATH. Ejecuta: source <ruta>/cangjie/envsetup.sh"; exit 1; }
command -v cjpm >/dev/null || { echo "cjpm no está en el PATH."; exit 1; }
cjc -v
export TERM="${TERM:-dumb}"

echo "==> proyecto-1/hola-cjc (cjc)"
( cd "$COD/proyecto-1/hola-cjc" && cjc main.cj -o hola && ./hola && rm -f hola )

# proyecto|entrada simulada para los programas que leen de la consola
PROYECTOS=(
  "proyecto-1/cjpmDemo|"
  "proyecto-1/cangjie|"
  "proyecto-2/tarea-2-1-consola|Corhuila\n12\n35.5\nyes\n"
  "proyecto-2/tarea-2-2-guardar-logs|1\n2\n3\n4\n5\n"
  "proyecto-2/tarea-2-3-filtrar-logs|3\n5\n6\n"
  "proyecto-3/tarea-3-1-validacion|abc\n999\n1005\nBogota\nHaidian\n"
  "proyecto-3/tarea-3-2-gestion-dispositivos|2\n1001\nHaidian\n2\n1002\nXicheng\n1\n4\n1002\nChaoyang\n5\nChaoyang\n3\n1001\n1\n6\n"
  "proyecto-3/tarea-3-3-analisis-csv|1\n2\n3\n4\n"
  "proyecto-3/tarea-3-4-funcional|1\n2\n3\n4\n"
  "proyecto-4/tarea-4-1-aire-acondicionado|1\n1\n3\n30\n\n3\n22\n4\n5\n2\n10003\nOffice AC\n\n3\n3\n\n4\n"
  "proyecto-4/tarea-4-2-dispositivos|1\n2\n3\n2\n2\n4\n3\n2\n\n3\n4\n"
  "proyecto-4/tarea-4-3-habitaciones|1\n2\n3\n22\n4\n5\n4\n3\n5\n3\n"
)
for item in "${PROYECTOS[@]}"; do
  p="${item%%|*}"; entrada="${item#*|}"
  echo "==> $p"
  ( cd "$COD/$p" && { [ ! -f ffi/program.c ] || cc -c ffi/program.c -o ffi/program.o; } && cjpm build && printf "$entrada" | timeout 120 cjpm run && cjpm test )
done
echo "Todos los proyectos compilaron, ejecutaron y pasaron sus pruebas."
```

## `scripts/probar-todo.ps1`

```powershell
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
```

## `tools/docker/Dockerfile`

```dockerfile
# Entorno reproducible para compilar y probar los proyectos Cangjie en Linux.
# El SDK no se descarga aquí: colócalo en .sdk/ (raíz del repo) antes de construir.
#   .sdk/cangjie-sdk-linux-x64-<versión>.tar.gz
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      binutils libc-dev libc++-dev libgcc-11-dev libstdc++-11-dev \
      ca-certificates bash \
 && rm -rf /var/lib/apt/lists/*

COPY .sdk/ /tmp/sdk/
RUN set -eux; \
    archivo="$(ls /tmp/sdk/cangjie-sdk-linux-*.tar.gz | head -1)"; \
    tar -xzf "$archivo" -C /opt; \
    rm -rf /tmp/sdk; \
    echo 'source /opt/cangjie/envsetup.sh' >> /etc/bash.bashrc

WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/bin/bash", "-c", "source /opt/cangjie/envsetup.sh && exec \"$@\"", "--"]
CMD ["bash", "scripts/probar-todo.sh"]
```

## `tools/docker/docker-compose.yml`

```yaml
# Uso (desde la raíz del repo):
#   docker compose -f tools/docker/docker-compose.yml up --build
services:
  cangjie:
    build:
      context: ../..
      dockerfile: tools/docker/Dockerfile
    working_dir: /workspace
    volumes:
      - ../../certification:/workspace/certification
      - ../../scripts:/workspace/scripts:ro
    command: ["bash", "scripts/probar-todo.sh"]
```

## `README.md`

````markdown
# Certificación · Programación Móvil (Corte 3)

[![Certificación Cangjie CI](https://github.com/Andresfg20/Certificaction/actions/workflows/certification-ci.yml/badge.svg)](https://github.com/Andresfg20/Certificaction/actions/workflows/certification-ci.yml)

Repositorio de evidencias de la certificación **Cangjie Programming** (Huawei ICT Academy) de **Andres Felipe Gomez Anacona**.

👉 Toda la entrega está en [`certification/`](certification/README.md).

| Carpeta | Contenido |
|---|---|
| [`certification/`](certification/) | README con ficha y avance, certificado, evidencias y código de los 4 proyectos |
| [`scripts/`](scripts/) | Validar estructura y compilar/probar todos los proyectos |
| [`.github/workflows/`](.github/workflows/) | CI: valida estructura, compila, ejecuta y prueba con Cangjie SDK 1.2.1 |
| [`tools/docker/`](tools/docker/) | Entorno Linux opcional |
| [`GUIA-COMPLETA.md`](GUIA-COMPLETA.md) | Guía de entorno, comandos y solución de problemas |

```bash
bash scripts/validar-certificacion.sh   # estructura
bash scripts/probar-todo.sh             # build + run + test (requiere Cangjie SDK)
```
````

## `certification/README.md`

````markdown
# Certificación Corte 3 · Cangjie Programming (Huawei ICT Academy)

[![Certificación Cangjie CI](https://github.com/Andresfg20/Certificaction/actions/workflows/certification-ci.yml/badge.svg)](https://github.com/Andresfg20/Certificaction/actions/workflows/certification-ci.yml)

## Ficha

| Dato | Detalle |
|---|---|
| Nombre completo | Andres Felipe Gomez Anacona |
| Usuario de GitHub | [Andresfg20](https://github.com/Andresfg20) |
| Nombre del curso | Cangjie Programming |
| Plataforma | Huawei Talent · ICT Academy |
| Enlace | https://e.huawei.com/en/talent/ict-academy/#/ict-courses-detail?courseId=fvXQlvE-whPqVon6TmjmbXFGBmk |
| Duración publicada | 56 horas |
| Fecha de inicio | 10 de noviembre de 2026 |
| Fecha de finalización | 13 de noviembre de 2026 |
| Nota del examen final | 70 puntos - 10/15 |
| Certificado | [certificado.pdf](certificado.pdf) · código `ICT20261114000013` · emitido el 14 de noviembre de 2026 |
| Ficha del curso | [00-ficha-del-curso.png](evidencias/00-ficha-del-curso.png) |

## Desarrollo del curso

| Proyecto | Fecha de término | Lo aprendido | Captura | Código |
|---|---|---|---|---|
| 1. Setting Up The Work Environment | 11 de noviembre de 2026 | Aprendí que el SDK de Cangjie es el paquete con el compilador, las librerías y las herramientas necesarias para programar en el lenguaje, y que hay que configurarlo con las variables de entorno para que el sistema lo reconozca. Entendí la diferencia entre `cjc`, que compila un archivo suelto, y `cjpm`, que crea y gestiona proyectos completos con su archivo `cjpm.toml`. Vi qué hace un IDE (editar, compilar, depurar y organizar todo en un solo lugar) y cómo la relación entre lenguaje y compilador hace que los dos evolucionen juntos. Hice el entorno en macOS, que al ser un sistema Unix funciona casi igual que Linux. | [01-proyecto-1.png](evidencias/01-proyecto-1.png) | [codigo/proyecto-1](codigo/proyecto-1/) |
| 2. Log File Management | 13 de noviembre de 2026 | Aprendí los tipos de datos básicos de Cangjie (enteros, decimales, booleanos y cadenas) y que hay que convertir los tipos explícitamente porque el lenguaje no mezcla tipos distintos en una operación. Practiqué leer datos de la consola y escribir logs en un archivo, usando `try` con recursos para que el archivo se cierre solo y `catch` para manejar errores como una entrada inválida. Usé `if`, `while` y `for-in` para armar menús que se repiten hasta que el usuario elige salir. Vi cómo definir funciones, sobrecargarlas (mismo nombre, distintos parámetros) y pasarles una lambda como último argumento para filtrar los logs por nivel. | [02-proyecto-2.png](evidencias/02-proyecto-2.png) | [codigo/proyecto-2](codigo/proyecto-2/) |
| 3. System Data Analysis | 13 de noviembre de 2026 | Aprendí a usar `enum` para limitar los valores posibles (como los distritos válidos) y `match` para cubrir todos los casos, algo más seguro que un `switch`. Entendí que `Option` (`?Int64`) reemplaza al `null` y obliga a decidir qué hacer cuando no hay valor, con `match`, `if-let` o `??`. Practiqué las colecciones (`Array`, `ArrayList`, `HashSet`, `HashMap`) y las tuplas para administrar una lista de dispositivos sin IDs repetidos. Leí un archivo CSV línea por línea, limpié los pagos fallidos y agrupé las ventas por región, producto y mes. Por último usé funciones de orden superior y el operador `\|>` para encadenar los pasos del análisis. | [03-proyecto-3.png](evidencias/03-proyecto-3.png) | [codigo/proyecto-3](codigo/proyecto-3/) |
| 4. Business Function Optimization | 13 de noviembre de 2026, 8:09 p. m. | Aprendí a modelar entidades con clases: propiedades con validación (`prop`), constructores, miembros estáticos y el patrón singleton para tener un único administrador de dispositivos. Practiqué la herencia (`open`, `override`, `redef`), las clases abstractas y las interfaces, y vi que una clase solo hereda de una pero puede implementar varias interfaces. Con el polimorfismo, una habitación llama a `operate()` o `open()` sin saber de qué tipo es cada dispositivo. Usé genéricos con restricciones (`where T <: Parsable<T>`) para validar entradas, y llamé funciones en C con `foreign` y `unsafe` para limpiar la consola. | [04-proyecto-4.png](evidencias/04-proyecto-4.png) | [codigo/proyecto-4](codigo/proyecto-4/) |
| Examen final | 13 de noviembre de 2026, 8:46 p. m. | Repasé los cuatro proyectos para el examen: tipos de datos y flujo de control, manejo de excepciones, `enum` y `Option` con `match`, colecciones y programación funcional, y orientación a objetos con herencia, interfaces, genéricos y polimorfismo. Con esto reforcé sobre todo las diferencias de Cangjie frente a otros lenguajes, como la conversión explícita de tipos y la ausencia de `null`. | [05-examen-final.png](evidencias/05-examen-final.png) | No aplica (el examen no lleva código) |

## Estructura

```text
certification/
├── README.md
├── certificado.pdf
├── evidencias/
│   ├── 00-ficha-del-curso.png
│   ├── 01-proyecto-1.png
│   ├── 02-proyecto-2.png
│   ├── 03-proyecto-3.png
│   ├── 04-proyecto-4.png
│   └── 05-examen-final.png
└── codigo/
    ├── proyecto-1/   # hola-cjc (cjc), cjpmDemo y cangjie (cjpm)
    ├── proyecto-2/   # tareas 2.1 consola, 2.2 guardar logs, 2.3 filtrar logs
    ├── proyecto-3/   # tareas 3.1 validación, 3.2 dispositivos, 3.3 CSV, 3.4 funcional
    └── proyecto-4/   # tareas 4.1 aire acondicionado, 4.2 dispositivos, 4.3 habitaciones (con FFI a C)
```

## Tecnologías

- **Lenguaje:** Cangjie (Huawei), SDK 1.x
- **Herramientas:** `cjc` (compilador), `cjpm` (gestor de proyectos y pruebas), `std.unittest`
- **Interoperabilidad:** funciones en C (`foreign` / `unsafe`) en el proyecto 4, compiladas con `gcc` o `clang`
- **IDE:** VS Code con la extensión de Cangjie, o DevEco Studio con DevEco-Cangjie-Plugin
- **CI:** GitHub Actions (valida la estructura, compila, ejecuta y prueba cada proyecto)

## Cómo ejecutar

Requisito: Cangjie SDK instalado y `cjc -v` respondiendo en la terminal.

```bash
# Todos los proyectos (Linux, macOS o Git Bash en Windows), desde la raíz del repo
bash scripts/probar-todo.sh

# Un proyecto concreto
cd certification/codigo/proyecto-1/cjpmDemo
cjpm build && cjpm run && cjpm test
```

En Windows con PowerShell: `powershell -ExecutionPolicy Bypass -File scripts/probar-todo.ps1`.

## Relación con la asignatura

En el proyecto de aula usamos Kotlin, y Cangjie se siente bastante familiar. Ambos son de tipado estático con inferencia y separan `let`/`var` como `val`/`var`. En tipos, Cangjie no hace conversiones automáticas entre `Int16` e `Int64`, algo parecido a lo estricto de Kotlin, y `Option` (`?Int64`) cumple el mismo papel que los tipos anulables (`Int?`) al obligar a manejar la ausencia de valor con `match`, `if-let` o `??`. En clases, las ideas son casi las mismas (`open`, `abstract`, interfaces, constructor principal), aunque la sintaxis cambia (`<:` en vez de `:`) y el `match` de Cangjie se parece al `when` de Kotlin. En excepciones, ambos usan `try/catch/finally`, y el `try` con recursos de Cangjie equivale al `use` de Kotlin. Para una app móvil aprovecharía el manejo seguro de valores ausentes, el `match` exhaustivo y la posibilidad de crear aplicaciones nativas de HarmonyOS, además de la interoperabilidad con C para usar librerías del sistema.
````

## `certification/codigo/proyecto-1/README.md`

````markdown
# Proyecto 1 · Setting Up The Work Environment

Configuración del entorno de desarrollo de Cangjie (SDK, `cjc`, `cjpm`, VS Code / DevEco Studio).

| Carpeta | Herramienta | Qué demuestra |
|---|---|---|
| `hola-cjc/` | `cjc` | Compilar un archivo suelto sin proyecto. |
| `cjpmDemo/` | `cjpm` | Proyecto creado con `cjpm init`, con prueba unitaria (`cjpm test`). |
| `cangjie/` | `cjpm` | Programa que resume el rol del IDE y la relación lenguaje–compilador. |

## Ejecutar

```bash
# 1) Archivo suelto con cjc
cd hola-cjc
cjc main.cj -o hola        # en Windows: cjc main.cj -o hola.exe
./hola                     # en Windows: .\hola.exe

# 2) Proyecto con cjpm
cd ../cjpmDemo
cjpm build
cjpm run
cjpm test

# 3) Resumen IDE / compilador
cd ../cangjie
cjpm run
```

Salida esperada de `hola-cjc` y `cjpmDemo`: `Hello Cangjie`.
````

## `certification/codigo/proyecto-1/cangjie/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "cangjie"
  description = "Resumen sobre IDE y compiladores"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-1/cangjie/src/main.cj`

```swift
package cangjie

main(): Int64 {
    println("=== Funciones y rol de un IDE ===")
    println("1. Juntar en una sola herramienta el editor, la compilación, la depuración y la gestión del proyecto.")
    println("2. Ayudar al programador con autocompletado y avisos de error mientras escribe.")
    println("3. Bajar la dificultad de entrada para que uno se concentre en la lógica y no en la configuración.")
    println("")
    println("=== Lenguaje de programación y compilador ===")
    println("1. El lenguaje me deja expresar la lógica de forma legible para humanos.")
    println("2. El compilador traduce ese código a instrucciones que la máquina ejecuta.")
    println("3. Cada característica nueva del lenguaje exige un compilador más capaz, y los avances del compilador permiten mejorar el lenguaje.")
    return 0
}
```

## `certification/codigo/proyecto-1/cjpmDemo/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "cjpmDemo"
  description = "Proyecto de prueba creado con cjpm init"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-1/cjpmDemo/src/main.cj`

```swift
package cjpmDemo

main(): Int64 {
    println(saludo())
    return 0
}
```

## `certification/codigo/proyecto-1/cjpmDemo/src/saludo.cj`

```swift
package cjpmDemo

// Lógica separada de main() para poder probarla con cjpm test
func saludo(): String {
    return "Hello Cangjie"
}
```

## `certification/codigo/proyecto-1/cjpmDemo/src/saludo_test.cj`

```swift
package cjpmDemo

import std.unittest.*
import std.unittest.testmacro.*

@Test
class SaludoTest {
    @TestCase
    func devuelveElSaludoEsperado(): Unit {
        @Expect(saludo(), "Hello Cangjie")
    }
}
```

## `certification/codigo/proyecto-1/hola-cjc/main.cj`

```swift
// Mi primer programa en Cangjie, compilado con cjc
main() {
    println("Hello Cangjie")
}
```

## `certification/codigo/proyecto-2/README.md`

````markdown
# Proyecto 2 · Log File Management

Código desarrollado en las tareas del curso. Cada tarea es un proyecto `cjpm` independiente.

| Tarea | Carpeta | Qué hace | Conceptos |
|---|---|---|---|
| 2.1 Console Log Generation | `tarea-2-1-consola/` | Pide datos del campus por consola (nombre, edificios, área, si es inteligente) y los imprime como una línea de log con fecha y hora. | Tipos básicos (`String`, `Int64`, `Float64`, `Bool`), conversión explícita con `parse`, `std.env` (stdin), `std.time.DateTime`, interpolación. |
| 2.2 Log File Saving | `tarea-2-2-guardar-logs/` | Menú repetitivo que guarda eventos (control de acceso, parqueadero, video vigilancia, cuarto de servidores) al final de `log.txt`. | `std.fs.File` en modo `Append`, `try` con recursos, `catch`, `while`, `if / else if`. |
| 2.3 Log File Analysis | `tarea-2-3-filtrar-logs/` | Lee `log.txt` y filtra las líneas por nivel (TRACE, DEBUG, INFO, WARN, ERROR). | `StringReader`, `for-in` con `where`, sobrecarga de funciones, lambda final (*trailing lambda*). |

## Ejecutar

```bash
cd tarea-2-1-consola && cjpm run       # responde las 4 preguntas
cd ../tarea-2-2-guardar-logs && cjpm run   # opciones 1-4 guardan, 5 sale; crea log.txt
cd ../tarea-2-3-filtrar-logs && cjpm run   # 1-5 filtran por nivel, 6 sale (usa el log.txt incluido)
```

Ejecución no interactiva (la usa el CI):

```bash
printf 'Corhuila\n12\n35.5\nyes\n' | cjpm run    # tarea 2.1
printf '1\n2\n3\n4\n5\n' | cjpm run               # tarea 2.2
printf '3\n5\n6\n' | cjpm run                     # tarea 2.3
```

## Ajustes hechos para el SDK 1.2.1

- `name` en `cjpm.toml`: `tarea-2-1-consola` → `tarea_2_1_consola` (y equivalentes). `cjpm` no acepta guiones en el nombre del paquete, y las tres tareas tenían el mismo nombre copiado.
- Primera línea `package <nombre>` en cada `main.cj`, obligatoria en el SDK 1.2.1.
````

## `certification/codigo/proyecto-2/tarea-2-1-consola/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "tarea_2_1_consola"
  description = "Proyecto 2 - Log File Management"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-2/tarea-2-1-consola/src/main.cj`

```swift
package tarea_2_1_consola

import std.env.*
import std.convert.*
import std.time.*

// Imprime una línea de log: fecha y hora, nivel, evento y mensaje
func logInfo(event: String, message: String) {
    println("${DateTime.now()} INFO ${event} ${message}")
}

main(): Int64 {
    println("Ingrese el nombre del campus:")
    let campusName: String = getStdIn().readln().getOrThrow()

    println("Ingrese el número de edificios:")
    let buildingNum: Int64 = Int64.parse(getStdIn().readln().getOrThrow())

    println("Ingrese el área construida (miles de metros cuadrados):")
    let buildingArea: Float64 = Float64.parse(getStdIn().readln().getOrThrow())

    println("¿Es un campus inteligente? (yes/no):")
    let isSmartCampus: Bool = getStdIn().readln().getOrThrow() == "yes"

    var message = "Message: "
    message += "Campus: ${campusName} "
    message += "Edificios: ${buildingNum} "
    message += "Área: ${buildingArea.format(".1")} miles de m2 "
    message += "Campus inteligente: ${isSmartCampus}"

    logInfo("Event: Entry operation", message)
    // Pregunta del curso: latitud y longitud irían en Float64 (tienen decimales)
    return 0
}
```

## `certification/codigo/proyecto-2/tarea-2-2-guardar-logs/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "tarea_2_2_guardar_logs"
  description = "Proyecto 2 - Log File Management"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-2/tarea-2-2-guardar-logs/src/main.cj`

```swift
package tarea_2_2_guardar_logs

import std.env.*
import std.fs.*
import std.time.*

// Escribe una línea al final del archivo y avisa en consola
func saveLog(file: File, event: String, message: String) {
    let line = "${DateTime.now()} INFO Event: ${event} Message: ${message}\n"
    file.write(line.toArray())
    println("Event: ${event} Message: ${message} guardado en log.txt")
}

main(): Int64 {
    while (true) {
        // try-with-resources: el archivo se cierra solo al terminar el bloque
        try (file = File(Path("log.txt"), Append)) {
            println("Seleccione el dato a guardar: [1] Control de acceso [2] Parqueadero [3] Video vigilancia [4] Cuarto de servidores [5] Salir")
            let input = getStdIn().readln().getOrThrow()

            if (input == "1") {
                saveLog(file, "Access Control", "Card Reader Fault")
            } else if (input == "2") {
                saveLog(file, "Parking Lot", "Available spaces 890/999")
            } else if (input == "3") {
                saveLog(file, "Video Surveillance", "Camera offline")
            } else if (input == "4") {
                saveLog(file, "Server Room Monitoring", "Temperature 25.3C Humidity 50.1%")
            } else if (input == "5") {
                println("Execution finished!")
                break
            } else {
                println("Opción inválida, intente de nuevo")
            }
        } catch (e: Exception) {
            println("Exception: ${e}")
            break
        }
    }
    return 0
}
```

## `certification/codigo/proyecto-2/tarea-2-3-filtrar-logs/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "tarea_2_3_filtrar_logs"
  description = "Proyecto 2 - Log File Management"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-2/tarea-2-3-filtrar-logs/log.txt`

```text
2025-07-10T07:43:16.160873911+08:00 INFO Event: Access Control Message: Card Reader Exception
2025-07-10T07:43:17.484151760+08:00 INFO Event: Parking Lot Message: Remaining Spaces 277/999
2025-07-10T07:43:18.255230047+08:00 INFO Event: Video Surveillance Message: Camera Offline
2025-07-10T07:43:19.035630407+08:00 INFO Event: Server Room Monitoring Message: Temperature 25.9C and Humidity 50.2%
```

## `certification/codigo/proyecto-2/tarea-2-3-filtrar-logs/src/main.cj`

```swift
package tarea_2_3_filtrar_logs

import std.env.*
import std.fs.*
import std.io.*

// Versión 1: si el comando es válido, filtra e imprime las líneas con el nivel
func parseCommand(input: String, valid: String, file: File, target: String): Bool {
    if (input == valid) {
        let log = StringReader(file)
        for (line in log.lines() where line.contains(target)) {
            println(line)
        }
        true
    } else {
        false
    }
}

// Versión 2 (sobrecarga): si el comando es válido, ejecuta la función recibida
func parseCommand(input: String, valid: String, callback: () -> Unit): Bool {
    if (input == valid) {
        callback()
        true
    } else {
        false
    }
}

main(): Int64 {
    while (true) {
        try (file = File(Path("./log.txt"), Read)) {
            println("Seleccione el nivel a filtrar: [1] trace [2] debug [3] info [4] warn [5] error [6] Salir")
            let input = getStdIn().readln().getOrThrow()

            if (parseCommand(input, "1", file, "TRACE")) { continue }
            if (parseCommand(input, "2", file, "DEBUG")) { continue }
            if (parseCommand(input, "3", file, "INFO")) { continue }
            if (parseCommand(input, "4", file, "WARN")) { continue }
            if (parseCommand(input, "5", file, "ERROR")) { continue }
            // Lambda al final: solo imprime; el break se hace fuera de la lambda
            if (parseCommand(input, "6") { println("Operation ended") }) { break }

            println("Please select again!")
        } catch (e: Exception) {
            println("System exception: ${e}")
            break
        }
    }
    return 0
}
```

## `certification/codigo/proyecto-3/README.md`

````markdown
# Proyecto 3 · System Data Analysis

Código desarrollado en las tareas del curso: registro y gestión de máquinas expendedoras y análisis de sus ventas. Cada tarea es un proyecto `cjpm` independiente.

| Tarea | Carpeta | Qué hace | Conceptos |
|---|---|---|---|
| 3.1 Validación de datos | `tarea-3-1-validacion/` | Pide el ID de una máquina (1001–1100) y su distrito, y repite la pregunta hasta que el dato sea válido. | `enum` con método `toString`, `match` exhaustivo, `Option` con `??`, `try / catch` y `throw`. |
| 3.2 Gestión de dispositivos | `tarea-3-2-gestion-dispositivos/` | Menú CRUD: imprimir, agregar (sin IDs repetidos), eliminar, modificar y consultar por zona. | `ArrayList` de tuplas `(Int64, String)`, `HashSet` para unicidad, `remove(at:)`. |
| 3.3 Análisis del CSV | `tarea-3-3-analisis-csv/` | Lee `smart_retail_sales.csv`, muestra registros, limpia los pagos fallidos y agrupa las ventas por región con barras. | `File.readFrom`, `ByteBuffer` + `StringReader`, alias `type`, parámetros con nombre y valor por defecto, `sort` con comparador. |
| 3.4 Análisis funcional | `tarea-3-4-funcional/` | Lee el CSV en flujo y agrupa las ventas por región, producto o mes con un *pipeline*. | Funciones de orden superior, lambdas guardadas en variables, `filter`, operador `\|>`, `try` con recursos. |

## Ejecutar

```bash
cd tarea-3-1-validacion && cjpm run
cd ../tarea-3-2-gestion-dispositivos && cjpm run
cd ../tarea-3-3-analisis-csv && cjpm run     # usa smart_retail_sales.csv de su carpeta
cd ../tarea-3-4-funcional && cjpm run
```

Ejecución no interactiva (la usa el CI):

```bash
printf 'abc\n999\n1005\nBogota\nHaidian\n' | cjpm run                    # 3.1: prueba entradas inválidas
printf '2\n1001\nHaidian\n2\n1002\nXicheng\n1\n4\n1002\nChaoyang\n5\nChaoyang\n3\n1001\n1\n6\n' | cjpm run   # 3.2
printf '1\n2\n3\n4\n' | cjpm run                                       # 3.3 y 3.4
```

## Ajustes hechos para el SDK 1.2.1

- `name` en `cjpm.toml` sin guiones (`tarea_3_1_validacion`, …) y primera línea `package <nombre>` en cada `main.cj`.
- Tarea 3.3: el CSV se llamaba `" smart_retail_sales.csv"` (con un espacio al inicio) y el programa busca `smart_retail_sales.csv`; se renombró.
- Tarea 3.4: error de compilación `expected 'Bool', found 'Unit'` en `readTradeFile`. Un `try` con recursos es de tipo `Unit`, así que se agregó `return false` al final de la función. La lógica no cambia.
````

## `certification/codigo/proyecto-3/tarea-3-1-validacion/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "tarea_3_1_validacion"
  description = "Proyecto 3 - System Data Analysis"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-3/tarea-3-1-validacion/src/main.cj`

```swift
package tarea_3_1_validacion

import std.env.*
import std.convert.*

// Enum con los únicos distritos permitidos
enum District {
    | Dongcheng
    | Xicheng
    | Haidian
    | Chaoyang
    | Fengtai

    func toString(): String {
        match (this) {
            case District.Dongcheng => "Dongcheng District"
            case District.Xicheng => "Xicheng District"
            case District.Haidian => "Haidian District"
            case District.Chaoyang => "Chaoyang District"
            case District.Fengtai => "Fengtai District"
        }
    }
}

// Pide el ID hasta que sea un entero entre 1001 y 1100
func inputDeviceID(): Int64 {
    var id: Int64 = 0
    while (true) {
        print("Ingrese el ID de la máquina (1001~1100): ")
        let input = getStdIn().readln() ?? ""
        try {
            let temp = Int64.parse(input)
            if (temp > 1100 || temp < 1001) {
                throw Exception("ID fuera de rango, intente de nuevo")
            }
            id = temp
            break
        } catch (e: Exception) {
            println("Error: ${e}")
        }
    }
    return id
}

// Pide el distrito hasta que coincida con uno de los permitidos
func inputDistrict(): District {
    while (true) {
        print("Ingrese el distrito (Dongcheng, Xicheng, Haidian, Chaoyang, Fengtai): ")
        let input = getStdIn().readln() ?? ""
        match (input) {
            case "Dongcheng" => return District.Dongcheng
            case "Xicheng" => return District.Xicheng
            case "Haidian" => return District.Haidian
            case "Chaoyang" => return District.Chaoyang
            case "Fengtai" => return District.Fengtai
            case _ => println("Distrito inválido, intente de nuevo")
        }
    }
    return District.Dongcheng
}

main(): Int64 {
    println("========== Registro de máquina expendedora ==========")
    let id = inputDeviceID()
    let district = inputDistrict()
    println("ID: ${id}, Ubicación: ${district.toString()}")
    return 0
}
```

## `certification/codigo/proyecto-3/tarea-3-2-gestion-dispositivos/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "tarea_3_2_gestion_dispositivos"
  description = "Proyecto 3 - System Data Analysis"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-3/tarea-3-2-gestion-dispositivos/src/main.cj`

```swift
package tarea_3_2_gestion_dispositivos

import std.collection.*
import std.env.*
import std.convert.*

enum District {
    | Dongcheng
    | Xicheng
    | Haidian
    | Chaoyang
    | Fengtai

    func toString(): String {
        match (this) {
            case District.Dongcheng => "Dongcheng District"
            case District.Xicheng => "Xicheng District"
            case District.Haidian => "Haidian District"
            case District.Chaoyang => "Chaoyang District"
            case District.Fengtai => "Fengtai District"
        }
    }
}

func inputDeviceID(): Int64 {
    var id: Int64 = 0
    while (true) {
        print("Ingrese el ID de la máquina (1001~1100): ")
        let input = getStdIn().readln() ?? ""
        try {
            let temp = Int64.parse(input)
            if (temp > 1100 || temp < 1001) {
                throw Exception("ID fuera de rango, intente de nuevo")
            }
            id = temp
            break
        } catch (e: Exception) {
            println("Error: ${e}")
        }
    }
    return id
}

func inputDistrict(): District {
    while (true) {
        print("Ingrese el distrito (Dongcheng, Xicheng, Haidian, Chaoyang, Fengtai): ")
        let input = getStdIn().readln() ?? ""
        match (input) {
            case "Dongcheng" => return District.Dongcheng
            case "Xicheng" => return District.Xicheng
            case "Haidian" => return District.Haidian
            case "Chaoyang" => return District.Chaoyang
            case "Fengtai" => return District.Fengtai
            case _ => println("Distrito inválido, intente de nuevo")
        }
    }
    return District.Dongcheng
}

// Lista de dispositivos (ID, ubicación) y conjunto de IDs para garantizar unicidad
let devices = ArrayList<(Int64, String)>()
let deviceIDs = HashSet<Int64>()

func printDevices() {
    println("Total de dispositivos: ${devices.size}")
    for (device in devices) {
        println("ID: ${device[0]}, Ubicación: ${device[1]}")
    }
}

func addDevice() {
    var id = inputDeviceID()
    while (deviceIDs.contains(id)) {
        println("ID repetido, ingrese otro")
        id = inputDeviceID()
    }
    deviceIDs.add(id)
    let location = inputDistrict().toString()
    devices.add((id, location))
    println("Registro exitoso, ID: ${id}, ${location}")
}

func deleteDevice() {
    let id = inputDeviceID()
    for (i in 0..devices.size) {
        if (devices[i][0] == id) {
            devices.remove(at: i)
            deviceIDs.remove(id)
            println("Dispositivo ${id} eliminado")
            return
        }
    }
    println("El dispositivo ${id} no existe")
}

func updateDevice() {
    let id = inputDeviceID()
    for (i in 0..devices.size) {
        if (devices[i][0] == id) {
            let district = inputDistrict().toString()
            devices[i] = (id, district)
            println("Ubicación actualizada: ${id} -> ${district}")
            return
        }
    }
    println("El dispositivo ${id} no existe")
}

func queryByDistrict() {
    let district = inputDistrict().toString()
    var num: Int64 = 0
    for (device in devices) {
        if (device[1] == district) {
            println("ID: ${device[0]}, Ubicación: ${device[1]}")
            num++
        }
    }
    if (num == 0) {
        println("Aún no hay dispositivos en ${district}")
    } else {
        println("Total en ${district}: ${num}")
    }
}

main(): Int64 {
    println("========== Gestión de máquinas expendedoras ==========")
    while (true) {
        println("Menú: [1] Imprimir [2] Agregar [3] Eliminar [4] Modificar [5] Consultar (zona) [6] Salir")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => printDevices()
            case "2" => addDevice()
            case "3" => deleteDevice()
            case "4" => updateDevice()
            case "5" => queryByDistrict()
            case "6" => break
            case _ => println("Comando inválido, intente de nuevo")
        }
    }
    return 0
}
```

## `certification/codigo/proyecto-3/tarea-3-3-analisis-csv/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "tarea_3_3_analisis_csv"
  description = "Proyecto 3 - System Data Analysis"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-3/tarea-3-3-analisis-csv/smart_retail_sales.csv`

```csv
date,machineId,region,timestamp,productId,productName,price,quantity,total,status
2025-05-03,1001,Haidian District,09:15:22,P01,Cola,3.50,2,7.00,Success
2025-05-03,1002,Dongcheng District,10:02:10,P02,Chips,5.00,1,5.00,Success
2025-05-04,1003,Haidian District,11:45:00,P03,Water,2.00,3,6.00,Failed
2025-05-04,1004,Xicheng District,12:30:41,P01,Cola,3.50,4,14.00,Success
2025-06-01,1005,Chaoyang District,08:20:05,P04,Juice,6.00,2,12.00,Success
2025-06-01,1006,Fengtai District,14:10:33,P02,Chips,5.00,5,25.00,Success
2025-06-02,1002,Dongcheng District,15:55:12,P03,Water,2.00,6,12.00,Success
2025-06-02,1001,Haidian District,16:40:48,P04,Juice,6.00,1,6.00,Failed
2025-07-10,1004,Xicheng District,09:05:19,P01,Cola,3.50,3,10.50,Success
2025-07-10,1005,Chaoyang District,13:25:50,P02,Chips,5.00,2,10.00,Success
```

## `certification/codigo/proyecto-3/tarea-3-3-analisis-csv/src/main.cj`

```swift
package tarea_3_3_analisis_csv

import std.collection.*
import std.env.*
import std.convert.*
import std.time.*
import std.fs.*
import std.io.*
import std.sort.*

// fecha, id máquina, región, hora, id producto, producto, precio, cantidad, total, pago exitoso
type TradeType = (String, Int64, String, String, String, String, Float64, Int64, Float64, Bool)

let rawdata = ArrayList<TradeType>()   // datos crudos
let trades = ArrayList<TradeType>()    // datos limpios

func safeParseInt64(str: String, defaultValue!: Int64 = 0): Int64 {
    try {
        Int64.parse(str)
    } catch (e: Exception) {
        defaultValue
    }
}

func safeParseFloat64(str: String, defaultValue!: Float64 = 0.0): Float64 {
    try {
        Float64.parse(str)
    } catch (e: Exception) {
        defaultValue
    }
}

// Convierte los bytes del CSV en registros, línea por línea
func parseLine(bytes: Array<Byte>): Int64 {
    let stream = ByteBuffer()
    stream.write(bytes)
    let reader = StringReader(stream)
    if (reader.readln().isNone()) {   // salta el encabezado
        return 0
    }
    var count: Int64 = 0
    var line = reader.readln()
    while (line.isSome()) {
        try {
            let fields = line.getOrThrow().split(",")
            if (fields.size < 10) {
                throw Exception("Campos insuficientes")
            }
            let id = safeParseInt64(fields[1])
            let price = safeParseFloat64(fields[6])
            let num = safeParseInt64(fields[7])
            let total = safeParseFloat64(fields[8])
            let status = fields[9].contains("Success")
            rawdata.add((fields[0], id, fields[2], fields[3], fields[4], fields[5], price, num, total, status))
            count++
        } catch (e: Exception) {
            println("Error en una fila: ${e}")
        }
        line = reader.readln()
    }
    return count
}

func readTradeFile(filename: String): Bool {
    try {
        let bytes = File.readFrom(filename)
        let start = DateTime.now()
        let count = parseLine(bytes)
        let used = DateTime.now() - start
        println("Se procesaron ${count} registros en ${used}")
        return true
    } catch (e: Exception) {
        println("No se pudo leer el archivo: ${e}")
        return false
    }
}

// [1] Muestra los primeros 5 registros
func showSomeData() {
    println("Fecha\tID\tRegión\tHora\tProd.ID\tProducto\tPrecio\tCant.\tTotal\tPago")
    let n = if (rawdata.size < 5) { rawdata.size } else { 5 }
    for (i in 0..n) {
        let r = rawdata[i]
        println("${r[0]}\t${r[1]}\t${r[2]}\t${r[3]}\t${r[4]}\t${r[5]}\t${r[6].format(".2")}\t${r[7]}\t${r[8].format(".2")}\t${r[9]}")
    }
}

// [2] Limpieza: deja solo los pagos exitosos
func filterByPayStatus() {
    trades.clear()
    var success: Int64 = 0
    var failed: Int64 = 0
    for (data in rawdata) {
        if (data[9]) {
            success++
            trades.add(data)
        } else {
            failed++
        }
    }
    println("Total: ${rawdata.size} Exitosas: ${success} Fallidas: ${failed}")
}

// Suma cantidad y monto por región
func tradesByLocation(): ArrayList<(String, Int64, Float64)> {
    let result = ArrayList<(String, Int64, Float64)>()
    for (trade in trades) {
        var found = false
        for (i in 0..result.size) {
            if (result[i][0] == trade[2]) {
                result[i] = (result[i][0], result[i][1] + trade[7], result[i][2] + trade[8])
                found = true
            }
        }
        if (!found) {
            result.add((trade[2], trade[7], trade[8]))
        }
    }
    return result
}

// [3] Estadística por región, de mayor a menor monto, con barras
func analysisByLocation() {
    if (trades.size == 0) {
        println("Primero haga la limpieza de datos (opción 2)\n")
        return
    }
    let stats = tradesByLocation()
    // LT = "a va antes que b": así queda de mayor a menor
    sort<(String, Int64, Float64)>(stats, by: {a, b =>
        if (a[2] > b[2]) { Ordering.LT } else if (a[2] < b[2]) { Ordering.GT } else { Ordering.EQ }
    }, stable: true)
    println("========== Ventas por región ==========")
    let maxTotal = stats[0][2]   // el primero es el mayor
    for (s in stats) {
        let length = Int64(s[2] / maxTotal * 40.0)
        println("${s[0]} Cantidad: ${s[1]} Total: ${s[2].format(".2")} RMB")
        println("|" * length)
    }
}

main(): Int64 {
    let csvFilename = "./smart_retail_sales.csv"
    if (!readTradeFile(csvFilename)) {
        println("Falló la lectura de datos.")
        return 1
    }
    println("Lectura exitosa, registros: ${rawdata.size}")
    while (true) {
        println("========== Procesamiento por lotes ==========")
        println("Menú: [1] Mostrar datos [2] Limpiar datos [3] Estadística por región [4] Salir")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => showSomeData()
            case "2" => filterByPayStatus()
            case "3" => analysisByLocation()
            case "4" => break
            case _ => println("Comando inválido, intente de nuevo")
        }
    }
    return 0
}
```

## `certification/codigo/proyecto-3/tarea-3-4-funcional/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "tarea_3_4_funcional"
  description = "Proyecto 3 - System Data Analysis"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-3/tarea-3-4-funcional/smart_retail_sales.csv`

```csv
date,machineId,region,timestamp,productId,productName,price,quantity,total,status
2025-05-03,1001,Haidian District,09:15:22,P01,Cola,3.50,2,7.00,Success
2025-05-03,1002,Dongcheng District,10:02:10,P02,Chips,5.00,1,5.00,Success
2025-05-04,1003,Haidian District,11:45:00,P03,Water,2.00,3,6.00,Failed
2025-05-04,1004,Xicheng District,12:30:41,P01,Cola,3.50,4,14.00,Success
2025-06-01,1005,Chaoyang District,08:20:05,P04,Juice,6.00,2,12.00,Success
2025-06-01,1006,Fengtai District,14:10:33,P02,Chips,5.00,5,25.00,Success
2025-06-02,1002,Dongcheng District,15:55:12,P03,Water,2.00,6,12.00,Success
2025-06-02,1001,Haidian District,16:40:48,P04,Juice,6.00,1,6.00,Failed
2025-07-10,1004,Xicheng District,09:05:19,P01,Cola,3.50,3,10.50,Success
2025-07-10,1005,Chaoyang District,13:25:50,P02,Chips,5.00,2,10.00,Success
```

## `certification/codigo/proyecto-3/tarea-3-4-funcional/src/main.cj`

```swift
package tarea_3_4_funcional

import std.collection.*
import std.env.*
import std.convert.*
import std.time.*
import std.fs.*
import std.io.*
import std.sort.*

type TradeType = (String, Int64, String, String, String, String, Float64, Int64, Float64, Bool)

let rawdata = ArrayList<TradeType>()

func safeParseInt64(str: String, defaultValue!: Int64 = 0): Int64 {
    try {
        Int64.parse(str)
    } catch (e: Exception) {
        defaultValue
    }
}

func safeParseFloat64(str: String, defaultValue!: Float64 = 0.0): Float64 {
    try {
        Float64.parse(str)
    } catch (e: Exception) {
        defaultValue
    }
}

// Lectura en flujo: no carga todo el archivo en memoria
func parseLine(reader: StringReader<File>): Unit {
    var line = reader.readln()
    while (line.isSome()) {
        try {
            let fields = line.getOrThrow().split(",")
            if (fields.size < 10) {
                throw Exception("Campos insuficientes")
            }
            rawdata.add((fields[0], safeParseInt64(fields[1]), fields[2], fields[3], fields[4], fields[5],
                safeParseFloat64(fields[6]), safeParseInt64(fields[7]), safeParseFloat64(fields[8]),
                fields[9].contains("Success")))
        } catch (e: Exception) {
            println("Error en una fila: ${e}")
        }
        line = reader.readln()
    }
}

func readTradeFile(filename: String): Bool {
    try (fileStream = File(filename, OpenMode.Read)) {
        let start = DateTime.now()
        println("Leyendo archivo...")
        let reader = StringReader(fileStream)
        if (reader.readln().isNone()) {   // encabezado
            return false
        }
        parseLine(reader)
        let used = DateTime.now() - start
        println("Se procesaron ${rawdata.size} registros en ${used}")
        return true
    } catch (e: Exception) {
        println("No se pudo leer el archivo: ${e}")
        return false
    }
    // try con recursos es de tipo Unit: el return final le da a la función su tipo Bool
    return false
}

// Limpieza: solo transacciones con pago exitoso
let tradeSuccessFilter = filter<TradeType>({ trade => trade[9] })

// Suma cantidad y monto agrupando por la clave que entregue keyOf
func aggregate(trades: Iterator<TradeType>, keyOf: (TradeType) -> String): ArrayList<(String, Int64, Float64)> {
    let result = ArrayList<(String, Int64, Float64)>()
    for (trade in trades) {
        let key = keyOf(trade)
        var found = false
        for (i in 0..result.size) {
            if (result[i][0] == key) {
                result[i] = (key, result[i][1] + trade[7], result[i][2] + trade[8])
                found = true
            }
        }
        if (!found) {
            result.add((key, trade[7], trade[8]))
        }
    }
    return result
}

let analysisByLocation: (Iterator<TradeType>) -> ArrayList<(String, Int64, Float64)> = { trades =>
    aggregate(trades, { t => t[2] })
}

let analysisByGood: (Iterator<TradeType>) -> ArrayList<(String, Int64, Float64)> = { trades =>
    aggregate(trades, { t => t[5] })
}

// La fecha viene como yyyy-MM-dd: el mes es la parte del medio
let analysisByMonth: (Iterator<TradeType>) -> ArrayList<(String, Int64, Float64)> = { trades =>
    aggregate(trades, { t => "Mes " + t[0].split("-")[1] })
}

// Ordena de mayor a menor monto total
let sortFun: (ArrayList<(String, Int64, Float64)>) -> Array<(String, Int64, Float64)> = { stats =>
    sort<(String, Int64, Float64)>(stats, by: {a, b =>
        if (a[2] > b[2]) { Ordering.LT } else if (a[2] < b[2]) { Ordering.GT } else { Ordering.EQ }
    }, stable: true)
    stats.toArray()
}

let printResult: (Array<(String, Int64, Float64)>) -> Unit = { analysis =>
    println("========== Estadísticas ==========")
    if (analysis.size > 0) {
        let maxTotal = analysis[0][2]
        for (element in analysis) {
            println("${element[0]} Cantidad: ${element[1]} Total: ${element[2].format(".2")} RMB")
            println("|" * Int64(element[2] / maxTotal * 40.0))
        }
    }
}

main(): Int64 {
    let csvFilename = "./smart_retail_sales.csv"
    println("Leyendo transacciones...")
    if (!readTradeFile(csvFilename) || rawdata.size == 0) {
        println("Falló la lectura de datos.")
        return 1
    }
    println("Lectura exitosa, registros: ${rawdata.size}")
    while (true) {
        println("========== Procesamiento por lotes ==========")
        println("Menú: [1] Por región [2] Por producto [3] Por mes [4] Salir")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => rawdata |> tradeSuccessFilter |> analysisByLocation |> sortFun |> printResult
            case "2" => rawdata |> tradeSuccessFilter |> analysisByGood |> sortFun |> printResult
            case "3" => rawdata |> tradeSuccessFilter |> analysisByMonth |> sortFun |> printResult
            case "4" => break
            case _ => println("Comando inválido, intente de nuevo")
        }
    }
    return 0
}
```

## `certification/codigo/proyecto-4/README.md`

````markdown
# Proyecto 4 · Business Function Optimization

Código desarrollado en las tareas del curso: software de gestión de dispositivos de hogar inteligente, que evoluciona de una sola clase a un modelo orientado a objetos completo. Cada tarea es un proyecto `cjpm` independiente que llama a funciones en C (`ffi/program.c`) para limpiar la consola.

| Tarea | Carpeta | Qué hace | Conceptos |
|---|---|---|---|
| 4.1 Aire acondicionado | `tarea-4-1-aire-acondicionado/` | Gestión de aires acondicionados: encender, conectar, temperatura (16–28 °C), velocidad del ventilador; agregar y eliminar equipos. | `class`, `prop` con validación en `set`, `static prop`, `enum` con `match`, singleton (`private init` + `static let`), `foreign` / `unsafe`. |
| 4.2 Dispositivos | `tarea-4-2-dispositivos/` | Sensor de temperatura y humedad, purificador de aire y báscula de grasa corporal con sus paneles de control. | Herencia (`open`, `override`), interfaces (`Openable`, monitoreo), paquetes (`task4_2.model`). |
| 4.3 Habitaciones | `tarea-4-3-habitaciones/` | Habitaciones con varios dispositivos: encender, conectar o apagar todos, y operar cada uno desde su propio panel. | Polimorfismo (`operate()` según el tipo real), una clase + varias interfaces, genéricos con restricciones (`where T <: Parsable<T> & Comparable<T>`). |

## Compilar y ejecutar

Cada tarea enlaza el objeto C `ffi/program.o` (`compile-option` en `cjpm.toml`). Hay que generarlo antes del primer build:

```bash
cd tarea-4-1-aire-acondicionado
cc -c ffi/program.c -o ffi/program.o   # gcc o clang
cjpm build && cjpm run
```

En Windows se necesita un compilador de C (por ejemplo `clang` de LLVM o `gcc` de MSYS2/MinGW). El SDK de Cangjie para Windows no lo incluye.

Ejecución no interactiva (la usa el CI):

```bash
printf '1\n1\n3\n30\n\n3\n22\n4\n5\n2\n10003\nOffice AC\n\n3\n3\n\n4\n' | cjpm run   # 4.1
printf '1\n2\n3\n2\n2\n4\n3\n2\n\n3\n4\n' | cjpm run                                # 4.2
printf '1\n2\n3\n22\n4\n5\n4\n3\n5\n3\n' | cjpm run                                 # 4.3
```

## Ajustes hechos para el SDK 1.2.1

- Tarea 4.1: faltaba la línea `package task4_1`.
- Tarea 4.1: error `The type of this catch block is 'Option<String>'...` en `askTemperature`. El `catch` terminaba en `getStdIn().readln()` (que devuelve `Option<String>`) y el `try` es `Unit`; se cambió por `let _ = getStdIn().readln()`.
- Tareas 4.2 y 4.3: error `undeclared identifier 'format'` en `main.cj`. `Float64.format()` es una extensión de `std.convert`, y ese archivo no la importaba; se agregó `import std.convert.*`.
- `ffi/program.o` es un archivo generado: lo excluye `.gitignore` y lo compilan el CI y los scripts.
````

## `certification/codigo/proyecto-4/tarea-4-1-aire-acondicionado/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "task4_1"
  description = "Proyecto 4 - Business Function Optimization"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = "./ffi/program.o"
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-4/tarea-4-1-aire-acondicionado/ffi/program.c`

```c
#include <stdlib.h>

void chcp65001() {
#ifdef _WIN32
    system("chcp 65001");
#endif
}

void clearScreen() {
#ifdef _WIN32
    system("cls");
#else
    system("clear");
#endif
}
```

## `certification/codigo/proyecto-4/tarea-4-1-aire-acondicionado/src/main.cj`

```swift
package task4_1

import std.collection.*
import std.env.*
import std.convert.*
import std.random.*

// Funciones en C (interoperabilidad)
foreign func clearScreen(): Unit
foreign func chcp65001(): Unit

enum FanSpeed {
    | LOW
    | MIDDLE
    | HIGH

    func toString(): String {
        match (this) {
            case LOW => "Low Speed"
            case MIDDLE => "Medium Speed"
            case HIGH => "High Speed"
        }
    }
}

class AirConditionerDevice {
    static prop deviceType: String {
        get() { "AIR_CONDITIONER_DEVICE" }
    }

    private var _deviceId: Int64
    mut prop deviceId: Int64 {
        get() { _deviceId }
        set(id) {
            if (id <= 0) {
                throw Exception("Device ID must be positive.")
            }
            _deviceId = id
        }
    }

    var deviceName: String
    var isOnline: Bool = false
    var isOpened: Bool = false
    var temperature: Float64 = 0.0
    var humidity: Float64 = 0.0
    var fanSpeed: FanSpeed = FanSpeed.MIDDLE

    private var _targetTemperature: Int64 = 25
    mut prop targetTemperature: Int64 {
        get() { _targetTemperature }
        set(value) {
            if (value < 16) {
                throw Exception("Temperature cannot be lower than 16°C.")
            }
            if (value > 28) {
                throw Exception("Temperature cannot be higher than 28°C.")
            }
            _targetTemperature = value
        }
    }

    init(deviceId: Int64, deviceName: String) {
        if (deviceId <= 0) {
            throw Exception("Device ID must be positive.")
        }
        this._deviceId = deviceId
        this.deviceName = deviceName
    }

    // Un equipo apagado no se puede conectar
    func connect() {
        if (!isOpened) {
            return
        }
        isOnline = true
    }

    func disconnect() {
        isOnline = false
    }

    func update() {
        if (isOpened) {
            temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
            humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        }
    }

    func open() {
        isOpened = true
        update()
    }

    // Al apagar: se desconecta y se reinician los datos
    func close() {
        isOpened = false
        isOnline = false
        temperature = 0.0
        humidity = 0.0
    }

    func togglePower() {
        if (isOpened) {
            close()
        } else {
            open()
        }
    }

    func toggleFanSpeed() {
        fanSpeed = match (fanSpeed) {
            case FanSpeed.LOW => FanSpeed.MIDDLE
            case FanSpeed.MIDDLE => FanSpeed.HIGH
            case FanSpeed.HIGH => FanSpeed.LOW
        }
    }

    func displayStatus() {
        update()
        let state = if (isOpened) {
            "On ${temperature.format(".1")}°C ${humidity.format(".0")}%"
        } else {
            "Off"
        }
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        println("Current status: ${state}")
        println("Target temperature: ${targetTemperature}°C")
        println("Fan speed mode: ${fanSpeed.toString()}")
    }

    func askTemperature() {
        print("Please enter temperature (16~28): ")
        let text = getStdIn().readln() ?? ""
        try {
            this.targetTemperature = Int64.parse(text)
        } catch (e: Exception) {
            // Falla si no es número o si está fuera de rango
            println("${e}")
            println("Press Enter to continue")
            // Se descarta el valor leído: el catch debe ser Unit como el bloque try
            let _ = getStdIn().readln()
        }
    }

    func operateByConsole() {
        while (true) {
            unsafe { clearScreen() }
            displayStatus()
            if (isOpened && isOnline) {
                println("Operation: [1] Connect [2] Power [3] Temperature [4] Fan Speed [5] Exit")
                let order = getStdIn().readln() ?? ""
                match (order) {
                    case "1" => if (isOnline) { disconnect() } else { connect() }
                    case "2" => togglePower()
                    case "3" => askTemperature()
                    case "4" => toggleFanSpeed()
                    case "5" => break
                    case _ => println("Command input error, please re-enter!")
                }
            } else {
                println("Operation: [1] Connect [2] Power [3] Exit")
                let order = getStdIn().readln() ?? ""
                match (order) {
                    case "1" => if (isOnline) { disconnect() } else { connect() }
                    case "2" => togglePower()
                    case "3" => break
                    case _ => println("Command input error, please re-enter!")
                }
            }
        }
    }
}

// Singleton: una sola instancia que guarda la lista de equipos
class AirConditionerManager {
    public let airconditioners = ArrayList<AirConditionerDevice>()

    private init() {
        let living = AirConditionerDevice(10001, "Living Room Air Conditioner")
        living.open()
        living.connect()
        airconditioners.add(living)

        let bedroom = AirConditionerDevice(10002, "Bedroom Air Conditioner")
        bedroom.open()
        bedroom.connect()
        airconditioners.add(bedroom)
    }

    private static let manager = AirConditionerManager()

    public static func getInstance(): AirConditionerManager {
        manager
    }

    public func addAirConditioner(device: AirConditionerDevice) {
        this.airconditioners.add(device)
    }

    public func removeAirConditioner(index: Int64) {
        this.airconditioners.remove(at: index)
    }
}

func pause() {
    println("Press Enter to continue.")
    getStdIn().readln()
}

func listDevices(manager: AirConditionerManager) {
    for (i in 0..manager.airconditioners.size) {
        let ac = manager.airconditioners[i]
        println("[${i + 1}] Device: ${ac.deviceName}; ID: ${ac.deviceId}")
    }
}

main(): Int64 {
    let manager = AirConditionerManager.getInstance()
    unsafe { chcp65001() }

    while (true) {
        unsafe { clearScreen() }
        println("===== Smart Air Conditioner Device Management Software =====")
        println("Please enter command: [1] Configure device [2] Add device [3] Delete device [4] Exit software")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" =>
                listDevices(manager)
                print("Please enter the number: ")
                let text = getStdIn().readln() ?? ""
                if (let Some(n) <- Int64.tryParse(text)) {
                    if (n >= 1 && n <= manager.airconditioners.size) {
                        manager.airconditioners[n - 1].operateByConsole()
                    } else {
                        println("Incorrect number, please try again!")
                        pause()
                    }
                } else {
                    println("Incorrect number, please try again!")
                    pause()
                }
            case "2" =>
                print("Please enter the device ID: ")
                let idText = getStdIn().readln() ?? ""
                try {
                    let id = Int64.parse(idText)
                    print("Please enter the device name: ")
                    let name = getStdIn().readln() ?? ""
                    manager.addAirConditioner(AirConditionerDevice(id, name))
                    println("Device added successfully!")
                } catch (e: Exception) {
                    println("${e}")
                }
                pause()
            case "3" =>
                listDevices(manager)
                print("Please enter the number: ")
                let text = getStdIn().readln() ?? ""
                if (let Some(n) <- Int64.tryParse(text)) {
                    if (n >= 1 && n <= manager.airconditioners.size) {
                        manager.removeAirConditioner(n - 1)
                        println("Device deleted successfully!")
                    } else {
                        println("Number error!")
                    }
                } else {
                    println("Number error!")
                }
                pause()
            case "4" => break
            case _ => continue
        }
    }
    return 0
}
```

## `certification/codigo/proyecto-4/tarea-4-2-dispositivos/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "task4_2"
  description = "Proyecto 4 - Business Function Optimization"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = "./ffi/program.o"
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-4/tarea-4-2-dispositivos/ffi/program.c`

```c
#include <stdlib.h>

void chcp65001() {
#ifdef _WIN32
    system("chcp 65001");
#endif
}

void clearScreen() {
#ifdef _WIN32
    system("cls");
#else
    system("clear");
#endif
}
```

## `certification/codigo/proyecto-4/tarea-4-2-dispositivos/src/main.cj`

```swift
package task4_2

import std.env.*
import std.convert.*   // necesario para Float64.format()
import task4_2.model.*

let sensor = SensorDevice(1001, "My Temperature and Humidity Sensor")
let airPurifier = AirPurifierDevice(1002, "My Air Purifier")
let bodyFatScale = BodyFatScaleDevice(1003, "My Body Fat Scale")

func operateSensor() {
    while (true) {
        clearConsole()
        sensor.displayStatus()
        println("Operation: [1] Connect [2] Update [3] Return")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => if (sensor.isOnline) { sensor.disconnect() } else { sensor.connect() }
            case "2" => sensor.update()
            case "3" => break
            case _ => println("Invalid command input, please try again!")
        }
    }
}

func operateAirPurifier() {
    while (true) {
        clearConsole()
        airPurifier.displayStatus()
        println("Operation: [1] Connect [2] Power [3] Update [4] Return")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => if (airPurifier.isOnline) { airPurifier.disconnect() } else { airPurifier.connect() }
            case "2" => airPurifier.togglePower()
            case "3" => airPurifier.update()
            case "4" => break
            case _ => println("Invalid command input, please try again!")
        }
    }
}

func operateBodyFatScale() {
    while (true) {
        clearConsole()
        bodyFatScale.displayStatus()
        println("Operation: [1] Connect [2] Measure [3] Return")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => if (bodyFatScale.isOnline) { bodyFatScale.disconnect() } else { bodyFatScale.connect() }
            case "2" =>
                let result = bodyFatScale.measure()
                let weight = result[0] ?? 0.0
                let bmi = result[1] ?? 0.0
                println("Measurement result: Weight: ${weight.format(".1")}kg, BMI: ${bmi.format(".1")}kg/m2")
                println("Press Enter to continue.")
                getStdIn().readln()
            case "3" => break
            case _ => println("Invalid command input, please try again!")
        }
    }
}

main(): Int64 {
    setUtf8()
    // Encender y conectar todo al iniciar
    sensor.connect()
    airPurifier.open()
    airPurifier.connect()
    bodyFatScale.connect()

    while (true) {
        clearConsole()
        println("===== Smart Device Management Software =====")
        sensor.displayStatus()
        airPurifier.displayStatus()
        bodyFatScale.displayStatus()
        println("Select device: [1] Temperature and Humidity Sensor [2] Air Purifier [3] Body Fat Scale [4] Exit Software")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => operateSensor()
            case "2" => operateAirPurifier()
            case "3" => operateBodyFatScale()
            case "4" => break
            case _ => println("Command input error, please try again!")
        }
    }
    return 0
}
```

## `certification/codigo/proyecto-4/tarea-4-2-dispositivos/src/model/device.cj`

```swift
package task4_2.model

import std.random.*
import std.convert.*

public open class Device {
    public static prop deviceType: String {
        get() { "DEVICE" }
    }

    private var _deviceId: Int64
    public mut prop deviceId: Int64 {
        get() { _deviceId }
        set(id) {
            if (id <= 0) {
                throw Exception("Device ID cannot be negative")
            }
            _deviceId = id
        }
    }

    public var deviceName: String
    public var isOnline: Bool = false

    public init(deviceId: Int64, deviceName: String) {
        this._deviceId = deviceId
        this.deviceName = deviceName
    }

    // Si el dispositivo es Openable y está apagado, no se conecta
    public func connect(): Unit {
        if (let Some(o) <- (this as Openable)) {
            if (!o.isOpened) {
                return
            }
        }
        isOnline = true
    }

    public func disconnect(): Unit {
        isOnline = false
    }
}

// Dispositivo con batería: cada subclase muestra la batería a su manera
public abstract class ChargeableDevice <: Device {
    public static prop deviceType: String {
        get() { "CHARGEABLE_DEVICE" }
    }

    public var batteryPercentage: UInt8 = 100

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    public init(deviceId: Int64, deviceName: String, batteryPercentage: UInt8) {
        super(deviceId, deviceName)
        this.batteryPercentage = batteryPercentage
    }

    public func showBatteryInformation(): Unit
}

public class AirPurifierDevice <: Device & Openable & TemperatureMonitoring & HumidityMonitoring {
    public static prop deviceType: String {
        get() { "AIR_PURIFIER_DEVICE" }
    }

    private var _humidity: Float64 = 0.0
    private var _temperature: Float64 = 0.0
    private var _pm25: Float64 = 0.0
    private var _isOpened: Bool = false

    public prop humidity: Float64 {
        get() { _humidity }
    }

    public prop temperature: Float64 {
        get() { _temperature }
    }

    public prop isOpened: Bool {
        get() { _isOpened }
    }

    public prop pm25: Float64 {
        get() { _pm25 }
    }

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    private func refreshData() {
        _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
        _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        _pm25 = Random().nextGaussianFloat64(mean: 30.0, sigma: 10.0)
    }

    public func open(): Unit {
        _isOpened = true
        refreshData()
    }

    public func close(): Unit {
        _isOpened = false
        isOnline = false
    }

    public func togglePower(): Unit {
        if (_isOpened) {
            close()
        } else {
            open()
        }
    }

    // Solo actualiza si está encendido y conectado
    public func update(): Unit {
        if (!_isOpened || !isOnline) {
            return
        }
        refreshData()
    }

    public func displayStatus(): Unit {
        update()
        let state = if (_isOpened) {
            "On PM2.5: ${pm25.format(".1")}ug/m3 ${temperature.format(".1")}°C ${humidity.format(".0")}%"
        } else {
            "Off"
        }
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        println("Current status: ${state}")
    }
}

public class SensorDevice <: ChargeableDevice & TemperatureMonitoring & HumidityMonitoring {
    public static prop deviceType: String {
        get() { "SENSOR_DEVICE" }
    }

    private var _humidity: Float64 = 0.0
    private var _temperature: Float64 = 0.0

    public prop humidity: Float64 {
        get() { _humidity }
    }

    public prop temperature: Float64 {
        get() { _temperature }
    }

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
        _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
        _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
    }

    // Al actualizar, la batería baja un poco (simulación)
    public func update(): Unit {
        if (!isOnline) {
            return
        }
        _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
        _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        if (batteryPercentage > 0) {
            batteryPercentage--
        }
    }

    public func showBatteryInformation(): Unit {
        println("Current battery level: ${batteryPercentage}%")
    }

    public func displayStatus(): Unit {
        update()
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        showBatteryInformation()
        println("Current status: ${temperature.format(".1")}°C ${humidity.format(".0")}%")
    }
}

public class BodyFatScaleDevice <: ChargeableDevice {
    public static prop deviceType: String {
        get() { "BODY_FAT_SCALE_DEVICE" }
    }

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    // Devuelve (peso, IMC); None si el dispositivo está desconectado
    public func measure(): (Option<Float64>, Option<Float64>) {
        if (!isOnline) {
            return (None, None)
        }
        let weight = Random().nextGaussianFloat64(mean: 60.0, sigma: 15.0)
        let bmi = Random().nextGaussianFloat64(mean: 20.0, sigma: 2.0)
        if (batteryPercentage > 0) {
            batteryPercentage--
        }
        return (Some(weight), Some(bmi))
    }

    public func showBatteryInformation(): Unit {
        if (batteryPercentage > 20) {
            println("Battery is sufficient.")
        } else {
            println("Low battery, please recharge in time.")
        }
    }

    public func displayStatus(): Unit {
        println("---------- ${deviceId} ${deviceName} ----------")
        showBatteryInformation()
        println("Connection status: ${isOnline}")
    }
}
```

## `certification/codigo/proyecto-4/tarea-4-2-dispositivos/src/model/interface.cj`

```swift
package task4_2.model

public interface Openable {
    prop isOpened: Bool
    func open(): Unit
    func close(): Unit
    func togglePower(): Unit
}

public interface TemperatureMonitoring {
    prop temperature: Float64
    func update(): Unit
}

public interface HumidityMonitoring {
    prop humidity: Float64
    func update(): Unit
}
```

## `certification/codigo/proyecto-4/tarea-4-2-dispositivos/src/model/utils.cj`

```swift
package task4_2.model

foreign func clearScreen(): Unit
foreign func chcp65001(): Unit

// Envoltorio público para que main limpie la pantalla sin declarar el foreign
public func clearConsole() {
    unsafe { clearScreen() }
}

public func setUtf8() {
    unsafe { chcp65001() }
}
```

## `certification/codigo/proyecto-4/tarea-4-3-habitaciones/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "task4_3"
  description = "Proyecto 4 - Business Function Optimization"
  version = "1.0.0"
  target-dir = ""
  src-dir = ""
  output-type = "executable"
  compile-option = "./ffi/program.o"
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]

[test-dependencies]
```

## `certification/codigo/proyecto-4/tarea-4-3-habitaciones/ffi/program.c`

```c
#include <stdlib.h>

void chcp65001() {
#ifdef _WIN32
    system("chcp 65001");
#endif
}

void clearScreen() {
#ifdef _WIN32
    system("cls");
#else
    system("clear");
#endif
}
```

## `certification/codigo/proyecto-4/tarea-4-3-habitaciones/src/main.cj`

```swift
package task4_3

import std.env.*
import std.convert.*   // necesario para Float64.format()
import task4_3.model.*

func manageDevice(room: Room) {
    while (true) {
        clearConsole()
        println("===== Smart Home Device Management Software =====")
        println("=== Room: ${room.roomId} ${room.roomName} ===")
        println("Devices: ${room.devicesCount}")
        println("Temperature: ${(room.temperature ?? 0.0).format(".1")}°C, Humidity: ${(room.humidity ?? 0.0).format(".1")}%")
        for (device in room.devices) {
            println("${device.deviceId} ${device.deviceName} Connection Status: ${device.isOnline}")
        }
        var menu = "Select device: "
        for (i in 0..room.devices.size) {
            menu += "[${i + 1}] ${room.devices[i].deviceName} "
        }
        menu += "[${room.devices.size + 1}] Open and connect all devices "
        menu += "[${room.devices.size + 2}] Close all devices "
        menu += "[${room.devices.size + 3}] Return"
        println(menu)

        let order = getStdIn().readln() ?? ""
        if (order == (room.devices.size + 1).toString()) {
            room.openAllDevices()
            room.connectAllDevices()
        } else if (order == (room.devices.size + 2).toString()) {
            room.closeAllDevices()
        } else if (order == (room.devices.size + 3).toString()) {
            break
        } else {
            var found = false
            for (i in 0..room.devices.size) {
                if (order == (i + 1).toString()) {
                    // Polimorfismo: cada tipo de dispositivo tiene su propio panel
                    room.devices[i].operate()
                    found = true
                }
            }
            if (!found) {
                println("Command input error, please try again!")
                println("Press Enter to continue.")
                getStdIn().readln()
            }
        }
    }
}

main(): Int64 {
    let roomManager = RoomManager.getInstance()
    for (room in roomManager.rooms) {
        room.openAllDevices()
        room.connectAllDevices()
    }
    setUtf8()

    while (true) {
        clearConsole()
        println("===== Smart Home Device Management Software =====")
        for (room in roomManager.rooms) {
            println("=== Room: ${room.roomId} ${room.roomName} ===")
            println("Devices: ${room.devicesCount}")
            println("Temperature: ${(room.temperature ?? 0.0).format(".1")}°C, Humidity: ${(room.humidity ?? 0.0).format(".1")}%")
        }
        var menu = "Select room: "
        for (i in 0..roomManager.rooms.size) {
            menu += "[${i + 1}] ${roomManager.rooms[i].roomName} "
        }
        menu += "[${roomManager.rooms.size + 1}] Exit"
        println(menu)

        let order = getStdIn().readln() ?? ""
        if (order == (roomManager.rooms.size + 1).toString()) {
            break
        }
        var found = false
        for (i in 0..roomManager.rooms.size) {
            if (order == (i + 1).toString()) {
                manageDevice(roomManager.rooms[i])
                found = true
            }
        }
        if (!found) {
            println("Incorrect command input, please try again!")
            println("Press Enter to continue.")
            getStdIn().readln()
        }
    }
    return 0
}
```

## `certification/codigo/proyecto-4/tarea-4-3-habitaciones/src/model/device.cj`

```swift
package task4_3.model

import std.env.*
import std.random.*
import std.convert.*

public enum FanSpeed {
    | LOW
    | MIDDLE
    | HIGH

    public func toString(): String {
        match (this) {
            case LOW => "Low Speed"
            case MIDDLE => "Medium Speed"
            case HIGH => "High Speed"
        }
    }
}

public open class Device {
    public static prop deviceType: String {
        get() { "DEVICE" }
    }

    private var _deviceId: Int64
    public mut prop deviceId: Int64 {
        get() { _deviceId }
        set(id) {
            if (id <= 0) {
                throw Exception("Device ID cannot be negative")
            }
            _deviceId = id
        }
    }

    public var deviceName: String
    public var isOnline: Bool = false

    public init(deviceId: Int64, deviceName: String) {
        this._deviceId = deviceId
        this.deviceName = deviceName
    }

    public func connect(): Unit {
        if (let Some(o) <- (this as Openable)) {
            if (!o.isOpened) {
                return
            }
        }
        isOnline = true
    }

    public func disconnect(): Unit {
        isOnline = false
    }

    // Las subclases los sobrescriben (polimorfismo)
    public open func displayStatus(): Unit {
        println("Status display is not implemented!")
    }

    public open func operate(): Unit {
        println("Operation is not implemented!")
    }
}

public class AirPurifierDevice <: Device & Openable & TemperatureMonitoring & HumidityMonitoring {
    public static prop deviceType: String {
        get() { "AIR_PURIFIER_DEVICE" }
    }

    private var _humidity: Float64 = 0.0
    private var _temperature: Float64 = 0.0
    private var _pm25: Float64 = 0.0
    private var _isOpened: Bool = false

    public prop humidity: Float64 {
        get() { _humidity }
    }

    public prop temperature: Float64 {
        get() { _temperature }
    }

    public prop isOpened: Bool {
        get() { _isOpened }
    }

    public prop pm25: Float64 {
        get() { _pm25 }
    }

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    private func refreshData() {
        _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
        _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        _pm25 = Random().nextGaussianFloat64(mean: 30.0, sigma: 10.0)
    }

    public func open(): Unit {
        _isOpened = true
        refreshData()
    }

    public func close(): Unit {
        _isOpened = false
        isOnline = false
    }

    public func togglePower(): Unit {
        if (_isOpened) {
            close()
        } else {
            open()
        }
    }

    public func update(): Unit {
        if (!_isOpened || !isOnline) {
            return
        }
        refreshData()
    }

    public override func displayStatus(): Unit {
        update()
        let state = if (_isOpened) {
            "On PM2.5: ${pm25.format(".1")}ug/m3 ${temperature.format(".1")}°C ${humidity.format(".0")}%"
        } else {
            "Off"
        }
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        println("Current status: ${state}")
    }

    public override func operate(): Unit {
        while (true) {
            clearConsole()
            displayStatus()
            println("Operations: [1] Connect [2] Power [3] Update [4] Back")
            let order = getStdIn().readln() ?? ""
            match (order) {
                case "1" => if (isOnline) { disconnect() } else { connect() }
                case "2" => togglePower()
                case "3" => update()
                case "4" => break
                case _ => println("Command input error, please re-enter!")
            }
        }
    }
}

public class AirConditionerDevice <: Device & Openable & TemperatureMonitoring & HumidityMonitoring {
    public static prop deviceType: String {
        get() { "AIR_CONDITIONER_DEVICE" }
    }

    private var _humidity: Float64 = 0.0
    private var _temperature: Float64 = 0.0
    private var _isOpened: Bool = false
    private var _targetTemperature: Int64 = 25
    public var fanSpeed: FanSpeed = FanSpeed.MIDDLE

    public prop humidity: Float64 {
        get() { _humidity }
    }

    public prop temperature: Float64 {
        get() { _temperature }
    }

    public prop isOpened: Bool {
        get() { _isOpened }
    }

    public mut prop targetTemperature: Int64 {
        get() { _targetTemperature }
        set(value) {
            if (value < 16) {
                throw Exception("Temperature cannot be lower than 16°C.")
            }
            if (value > 28) {
                throw Exception("Temperature cannot be higher than 28°C.")
            }
            _targetTemperature = value
        }
    }

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    public func update(): Unit {
        if (_isOpened) {
            _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
            _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        }
    }

    public func open(): Unit {
        _isOpened = true
        update()
    }

    public func close(): Unit {
        _isOpened = false
        isOnline = false
        _temperature = 0.0
        _humidity = 0.0
    }

    public func togglePower(): Unit {
        if (_isOpened) {
            close()
        } else {
            open()
        }
    }

    public func toggleFanSpeed(): Unit {
        fanSpeed = match (fanSpeed) {
            case FanSpeed.LOW => FanSpeed.MIDDLE
            case FanSpeed.MIDDLE => FanSpeed.HIGH
            case FanSpeed.HIGH => FanSpeed.LOW
        }
    }

    public override func displayStatus(): Unit {
        update()
        let state = if (_isOpened) {
            "On ${temperature.format(".1")}°C ${humidity.format(".0")}%"
        } else {
            "Off"
        }
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        println("Current status: ${state}")
        println("Preset temperature: ${targetTemperature}°C")
        println("Fan speed mode: ${fanSpeed.toString()}")
    }

    public override func operate(): Unit {
        while (true) {
            clearConsole()
            displayStatus()
            println("Operation: [1] Connect [2] Power [3] Temperature [4] Fan Speed [5] Exit")
            let order = getStdIn().readln() ?? ""
            match (order) {
                case "1" => if (isOnline) { disconnect() } else { connect() }
                case "2" => togglePower()
                case "3" =>
                    // Solo si está encendido y conectado
                    if (_isOpened && isOnline) {
                        print("Please enter temperature (16~28): ")
                        try {
                            targetTemperature = Utils.inputInfo<Int64>(16, 28)
                        } catch (e: Exception) {
                            println("${e}")
                            println("Press Enter to continue.")
                            getStdIn().readln()
                        }
                    }
                case "4" =>
                    if (_isOpened && isOnline) {
                        toggleFanSpeed()
                    }
                case "5" => break
                case _ => println("Command input error, please re-enter!")
            }
        }
    }
}
```

## `certification/codigo/proyecto-4/tarea-4-3-habitaciones/src/model/interface.cj`

```swift
package task4_3.model

public interface Openable {
    prop isOpened: Bool
    func open(): Unit
    func close(): Unit
    func togglePower(): Unit
}

public interface TemperatureMonitoring {
    prop temperature: Float64
    func update(): Unit
}

public interface HumidityMonitoring {
    prop humidity: Float64
    func update(): Unit
}
```

## `certification/codigo/proyecto-4/tarea-4-3-habitaciones/src/model/room.cj`

```swift
package task4_3.model

import std.collection.*

public enum RoomType {
    | LIVING_ROOM
    | BED_ROOM
}

public class Room {
    public var roomId: Int64
    public var roomName: String
    public var roomType: RoomType
    public let devices: ArrayList<Device> = ArrayList<Device>()

    public prop devicesCount: Int64 {
        get() { devices.size }
    }

    // Temperatura del primer dispositivo conectado que mida temperatura
    public prop temperature: Option<Float64> {
        get() {
            for (device in devices) {
                if (device.isOnline) {
                    if (let Some(t) <- (device as TemperatureMonitoring)) {
                        return Some(t.temperature)
                    }
                }
            }
            return None
        }
    }

    // Humedad del primer dispositivo conectado que mida humedad
    public prop humidity: Option<Float64> {
        get() {
            for (device in devices) {
                if (device.isOnline) {
                    if (let Some(h) <- (device as HumidityMonitoring)) {
                        return Some(h.humidity)
                    }
                }
            }
            return None
        }
    }

    public init(roomId: Int64, roomName: String, roomType: RoomType) {
        this.roomId = roomId
        this.roomName = roomName
        this.roomType = roomType
    }

    public func addDevice(device: Device) {
        devices.add(device)
    }

    public func removeDeviceById(deviceId: Int64) {
        devices.removeIf { d: Device => d.deviceId == deviceId }
    }

    public func openAllDevices() {
        for (device in devices) {
            if (let Some(o) <- (device as Openable)) {
                o.open()
            }
        }
    }

    public func connectAllDevices() {
        for (device in devices) {
            device.connect()
        }
    }

    public func closeAllDevices() {
        for (device in devices) {
            if (let Some(o) <- (device as Openable)) {
                o.close()
            }
        }
    }
}

// Singleton con la lista de habitaciones
public class RoomManager {
    public let rooms: ArrayList<Room>

    private init() {
        rooms = ArrayList<Room>()

        let room1 = Room(2001, "My Bedroom", RoomType.BED_ROOM)
        room1.addDevice(AirPurifierDevice(1001, "Bedroom Air Purifier"))
        room1.addDevice(AirConditionerDevice(1002, "Bedroom Air Conditioner"))
        rooms.add(room1)

        let room2 = Room(2002, "My Living Room", RoomType.LIVING_ROOM)
        room2.addDevice(AirConditionerDevice(2001, "Living Room Air Conditioner"))
        rooms.add(room2)
    }

    private static let instance: RoomManager = RoomManager()

    public static func getInstance(): RoomManager {
        return instance
    }
}
```

## `certification/codigo/proyecto-4/tarea-4-3-habitaciones/src/model/utils.cj`

```swift
package task4_3.model

import std.convert.*
import std.env.*

foreign func clearScreen(): Unit
foreign func chcp65001(): Unit

public func clearConsole() {
    unsafe { clearScreen() }
}

public func setUtf8() {
    unsafe { chcp65001() }
}

public class Utils {
    // Lee de consola y convierte a T; 3 intentos
    public static func inputInfo<T>(): T where T <: Parsable<T> {
        var retry = 3
        while (retry > 0) {
            let input = getStdIn().readln() ?? ""
            if (let Some(v) <- T.tryParse(input)) {
                return v
            }
            print("Input error, please re-enter: ")
            retry--
        }
        throw Exception("Input error exceeded 3 times, entry cancelled!")
    }

    // Igual, pero además valida que esté entre min y max
    public static func inputInfo<T>(min: T, max: T): T where T <: Parsable<T> & Comparable<T> {
        var retry = 3
        while (retry > 0) {
            let input = getStdIn().readln() ?? ""
            if (let Some(v) <- T.tryParse(input)) {
                if (v >= min && v <= max) {
                    return v
                }
                print("Value out of range, please re-enter: ")
            } else {
                print("Input error, please re-enter: ")
            }
            retry--
        }
        throw Exception("Input error exceeded 3 times, entry cancelled!")
    }
}
```

# Configuración del Entorno Local

## Software requerido (Windows 10/11)

| Software | Versión recomendada | Para qué |
|---|---|---|
| Git for Windows | 2.45 o superior (incluye Git Bash) | Control de versiones y ejecutar `.sh` |
| Cangjie SDK | La misma de tu Mac: 1.2.0 (o la LTS/STS vigente) | `cjc`, `cjpm`, `cjfmt` |
| Visual Studio Code | Última estable | Editor |
| DevEco Studio (opcional) | La que pide el curso | Apps HarmonyOS y emulador |
| Docker Desktop (opcional) | 4.x | Probar en Linux sin instalar el SDK |
| GitHub CLI `gh` (opcional) | 2.x | Crear el repo desde la terminal |

## Instalar el Cangjie SDK en Windows

1. Descarga `cangjie-sdk-windows-x64-<versión>.zip` (o `.exe`) desde el centro de descargas oficial: https://cangjie-lang.cn/download
2. Descomprime en una ruta **sin espacios ni tildes**, por ejemplo `C:\dev\cangjie`. (Evita OneDrive para el SDK.)
3. Variables de entorno (Inicio → "variables de entorno" → Variables del sistema):
   - Nueva: `CANGJIE_HOME = C:\dev\cangjie`
   - Agrega al `Path`:
     - `%CANGJIE_HOME%\bin`
     - `%CANGJIE_HOME%\tools\bin`
     - `%CANGJIE_HOME%\tools\lib`
     - `%CANGJIE_HOME%\runtime\lib\windows_x86_64_cjnative`
     - `%USERPROFILE%\.cjpm\bin`
4. Alternativa por sesión (sin tocar variables): en PowerShell `. C:\dev\cangjie\envsetup.ps1`; en Git Bash `source /c/dev/cangjie/envsetup.sh`.
5. Abre una terminal nueva y verifica: `cjc -v` y `cjpm --help`.

## macOS / Linux

```bash
tar -xzf cangjie-sdk-<plataforma>-<versión>.tar.gz -C ~
echo 'source ~/cangjie/envsetup.sh' >> ~/.zshrc   # o ~/.bashrc
source ~/.zshrc && cjc -v
# Linux (Ubuntu) además: sudo apt install binutils libc-dev libc++-dev libgcc-11-dev
```

## Extensiones de VS Code

- **Cangjie** (extensión oficial de Huawei: búscala como "Cangjie" en el Marketplace o instálala desde el `.vsix` de la página de descargas). En su configuración apunta la ruta del SDK a `C:\dev\cangjie`.
- EditorConfig for VS Code · GitHub Actions · GitLens · markdownlint · Markdown All in One (las recomienda `.vscode/extensions.json`).

## Configuración de Git (una sola vez)

```bash
git config --global user.name  "Andres Felipe Gomez Anacona"
git config --global user.email "tu-correo@ejemplo.com"
git config --global init.defaultBranch main
git config --global core.autocrlf input     # el repo usa LF (.gitattributes)
git config --global core.quotepath false    # muestra bien tildes y ñ
```

# Comandos de Instalación

```bash
# Cangjie no usa dependencias externas: no hay npm/pip/maven que instalar.
# Solo verifica el SDK:
cjc -v
cjpm --help

# (Opcional) Docker: coloca el SDK de Linux en .sdk/ y construye
mkdir -p .sdk   # copia aquí cangjie-sdk-linux-x64-<versión>.tar.gz
docker compose -f tools/docker/docker-compose.yml build
```

## Probar en WSL (Ubuntu) sin cambiar la seguridad de Windows

```bash
# Dentro de Ubuntu (WSL)
sudo apt update && sudo apt install -y binutils libc-dev libc++-dev libgcc-11-dev
mkdir -p ~/sdk && tar -xzf /mnt/c/Users/Usuario/Downloads/cangjie-sdk-linux-x64-1.2.1.tar.gz -C ~/sdk
echo 'source ~/sdk/cangjie/envsetup.sh' >> ~/.bashrc && source ~/.bashrc
cp -r /mnt/c/dev/certificacion ~/certificacion && cd ~/certificacion
bash scripts/probar-todo.sh
```

# Comandos de Ejecución

```bash
# Desde la raíz del repo — todo de una vez
bash scripts/probar-todo.sh                                     # Git Bash / macOS / Linux
powershell -ExecutionPolicy Bypass -File scripts/probar-todo.ps1 # PowerShell

# Proyecto por proyecto
cd certification/codigo/proyecto-1/hola-cjc && cjc main.cj -o hola.exe && ./hola.exe
cd ../cjpmDemo   && cjpm build && cjpm run && cjpm test
cd ../cangjie    && cjpm run
cd ../../proyecto-2 && cjpm build && cjpm run && cjpm test
cd ../proyecto-3    && cjpm build && cjpm run && cjpm test
cd ../proyecto-4    && cjpm build && cjpm run && cjpm test

# Validar estructura (sin SDK)
bash scripts/validar-certificacion.sh
STRICT=1 bash scripts/validar-certificacion.sh   # entrega final: exige capturas y PDF

# Docker (opcional)
docker compose -f tools/docker/docker-compose.yml up --build
```

# Configuración Git y GitHub

## Caso A · Ya tienes el repositorio semanal en GitHub (lo más probable)

```bash
git clone https://github.com/TU_USUARIO/TU_REPO.git
cd TU_REPO
git checkout -b feat/certification
# Copia aquí el contenido de LISTO-PARA-REPO/ (incluidos ocultos). En Git Bash:
cp -r "/c/Users/Usuario/OneDrive - corhuila.edu.co/Documentos/GIT/CERTIFICACIÓN MOVIL/LISTO-PARA-REPO/." .
bash scripts/validar-certificacion.sh
git add .
git status            # revisa que no aparezcan target/, .DS_Store ni __MACOSX
git commit -m "feat(certification): estructura, código de proyectos 1-4, CI y evidencias"
git push -u origin feat/certification
# Luego abre el Pull Request y haz merge a main (o haz push directo a main si tu docente lo pide así):
# git checkout main && git merge feat/certification && git push
```

## Caso B · Repositorio nuevo desde cero

```bash
mkdir programacion-movil && cd programacion-movil
git init -b main
mkdir 01-week 02-week   # … tus carpetas semanales
cp -r "/c/Users/Usuario/OneDrive - corhuila.edu.co/Documentos/GIT/CERTIFICACIÓN MOVIL/LISTO-PARA-REPO/." .
git add .
git commit -m "feat(certification): estructura inicial de la certificación Cangjie"
# Crea el repo vacío en https://github.com/new (sin README) y conéctalo:
git remote add origin https://github.com/TU_USUARIO/programacion-movil.git
git push -u origin main
# o con GitHub CLI:  gh repo create programacion-movil --public --source . --push
```

## Agregar las evidencias pendientes a medida que avances

```bash
# Guarda cada captura con el nombre exacto y súbela
git add certification/evidencias/02-proyecto-2.png certification/README.md
git commit -m "docs(certification): evidencia y aprendizajes del proyecto 2"
git push
```

Para la entrega final: pestaña **Actions → Certificación Cangjie CI → Run workflow** y marca *strict*.

# Validación Final

| Verificación | Resultado |
|---|---|
| `certification/` en la raíz, no dentro de una semana | ✔ |
| Carpetas `evidencias/` y `codigo/proyecto-1..4` | ✔ (script `validar-certificacion.sh`: 0 errores) |
| Cada proyecto cjpm con `cjpm.toml` + `src/main.cj` | ✔ 5 paquetes |
| Nombres de paquete válidos (`log_manager`, `data_analysis`, `business_opt`) | ✔ identificadores sin guiones |
| Importaciones: `std.collection`, `std.math`, `std.convert`, `std.unittest(.testmacro)` declaradas en cada archivo que las usa | ✔ |
| Sin dependencias externas | ✔ |
| Pruebas unitarias en proyectos 1 (cjpmDemo), 2, 3 y 4 | ✔ |
| YAML del workflow y compose válidos; scripts `bash -n` correctos; paréntesis/llaves balanceados en todos los `.cj` | ✔ |
| `.gitignore` excluye `target/`, binarios, `.DS_Store`, `__MACOSX` y no excluye PNG/PDF | ✔ |
| `.gitattributes` fuerza LF en `.cj/.sh/.toml` (evita errores de `\r` en CI) | ✔ |
| Compilación real con SDK 1.2.1 | ✔ Windows: los 5 proyectos compilan con `cjpm build` y `hola-cjc` con `cjc`. Linux (SDK 1.2.1 x64): `scripts/probar-todo.sh` termina con código 0: build + run + **prueba unitaria en verde** (cjpmDemo); las 10 tareas de los proyectos 2, 3 y 4 se ejecutan con entrada simulada. |
| Declaración `package` | ✔ Cada `.cj` empieza con `package <nombre del cjpm.toml>`: el SDK 1.2.1 la exige cuando el paquete tiene varios archivos. |
| Evidencias 00, 02–05 y `certificado.pdf` | ⏳ Pendientes: deben salir de tu cuenta real |

# Problemas Potenciales y Soluciones

| Problema | Causa | Solución |
|---|---|---|
| Windows: `cjpm test` muestra `could not load the dynamic library ... libcangjie-std-unittest.testmacro.dll`, o un ejecutable da `Created process failed` / "Una directiva de Control de aplicaciones bloqueó este archivo" | **Smart App Control** de Windows 11 bloquea las DLL y los .exe sin firma empresarial (error 4551). No es un error del código. | Opción segura: correr las pruebas en Linux (WSL Ubuntu con `cangjie-sdk-linux-x64-1.2.1.tar.gz`) o dejarlas al CI de GitHub. Opción alternativa: desactivar Smart App Control en Seguridad de Windows → Control de aplicaciones y navegador (en muchos equipos no se puede volver a activar sin reinstalar Windows). |
| `the package name in ...\src is wrong` | Falta `package <nombre>` en un `.cj` | Agrega `package <nombre del cjpm.toml>` como primera línea. |
| `cjc` no se reconoce | SDK fuera del PATH | Ejecuta `envsetup.ps1/.sh` o configura las variables de la sección de entorno y abre una terminal nueva. |
| Error al compilar desde OneDrive o rutas con tildes | Rutas con espacios/acentos | Clona el repo en `C:\dev\TU_REPO`. |
| `cjpm` se queja de `cjc-version` | SDK distinto a 1.2.0 | Cambia `cjc-version` en el `cjpm.toml` a la versión que muestra `cjc -v`. El CI ya lo hace solo. |
| Error de API como `add` vs `append`/`put` | SDK 0.53.x (antiguo) | Usa SDK 1.x. En 1.x `ArrayList`/`HashSet` usan `add`. |
| `undeclared identifier 'format'` | Falta `import std.convert.*` en el archivo que usa `Float64.format()` | Agrega el import en ese archivo. |
| Proyecto 4: `cannot find ./ffi/program.o` | No se compiló el código C | `cc -c ffi/program.c -o ffi/program.o` (gcc o clang) antes de `cjpm build`. |
| `hola.exe` no aparece en Windows | Falta extensión | `cjc main.cj -o hola.exe`. |
| Falla el job de CI al instalar el SDK | Cambio en canales STS/LTS | El workflow reintenta con LTS; si ambos fallan, fija `version:` a un número concreto en el YAML. |
| Aparecen `.DS_Store` o `__MACOSX` | Archivos copiados de macOS | Ya están en `.gitignore`; si se colaron: `git rm -r --cached '**/.DS_Store'`. |
| La insignia del README no carga | Workflow aún no ejecutado | Haz un push que toque `certification/` o lánzalo desde Actions. |
| Docker: `COPY .sdk/` falla | Falta el tar.gz | Copia el SDK de Linux en `.sdk/` antes de `build`. |
| `Permission denied` al correr `.sh` | Bit de ejecución | Ejecuta con `bash scripts/…sh` o `git update-index --chmod=+x scripts/*.sh`. |

# Checklist de Entrega

- [ ] Cangjie SDK instalado y `cjc -v` funcionando
- [ ] `bash scripts/probar-todo.sh` (o `.ps1`) termina sin errores
- [ ] Contenido de `LISTO-PARA-REPO/` copiado a la raíz del repo (con archivos ocultos)
- [ ] `certification/` al mismo nivel que `01-week … 16-week`
- [x] Usuario de GitHub escrito en `certification/README.md`
- [x] `evidencias/00-ficha-del-curso.png`
- [x] `evidencias/01-proyecto-1.png`
- [x] `evidencias/02-proyecto-2.png` + fila del proyecto 2 en el README
- [x] `evidencias/03-proyecto-3.png` + fila del proyecto 3
- [x] `evidencias/04-proyecto-4.png` + fila del proyecto 4
- [x] `evidencias/05-examen-final.png` + nota del examen
- [x] `certificado.pdf` descargado de Huawei Talent
- [x] Código de proyectos 2–4 = tareas reales del curso
- [x] Sección "Relación con la asignatura" personalizada
- [ ] `STRICT=1 bash scripts/validar-certificacion.sh` → 0 errores
- [ ] Push hecho y workflow **Certificación Cangjie CI** en verde
