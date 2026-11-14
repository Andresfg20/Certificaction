# Guía completa · Certificación Cangjie Programming (Huawei ICT Academy)

> Todo lo de esta guía ya está creado en la carpeta `LISTO-PARA-REPO/`. Copia **su contenido** (incluidos los archivos ocultos `.github`, `.gitignore`, etc.) a la raíz de tu repositorio, al mismo nivel que `01-week … 16-week`.

# Resumen del Proyecto

Repositorio de evidencias de la certificación **Cangjie Programming** (Huawei Talent · ICT Academy, 56 h) para el Corte 3 de Programación Móvil. La carpeta `certification/` vive en la raíz del repositorio y contiene el README con la ficha y el avance, el certificado, las capturas de evidencia y el código de los 4 proyectos del curso:

| Proyecto | Paquete cjpm | Contenido |
|---|---|---|
| 1 · Setting Up The Work Environment | `hola-cjc`, `cjpmDemo`, `cangjie` | Tu código original (cjc vs cjpm) + prueba unitaria añadida a `cjpmDemo`. |
| 2 · Log File Management | `tarea_2_1_consola`, `tarea_2_2_guardar_logs`, `tarea_2_3_filtrar_logs` | **Tu código del curso**: log por consola, guardado en `log.txt` con `try` con recursos, filtrado por nivel con sobrecarga y lambda final. |
| 3 · System Data Analysis | `tarea_3_1_validacion`, `tarea_3_2_gestion_dispositivos`, `tarea_3_3_analisis_csv`, `tarea_3_4_funcional` | **Tu código del curso**: `enum` + `match`, `Option`, CRUD con `ArrayList`/`HashSet`, análisis del CSV de ventas y *pipeline* funcional con `\|>`. |
| 4 · Business Function Optimization | `business_opt` | Strategy para descuentos, O(n²)→O(n) con HashSet, HashMap, memoización. |

**Supuestos tomados**
1. Lenguaje: **Cangjie** (SDK 1.2.1 instalado y validado en tu equipo) (detectado por `cjpm.toml`, `.cj` y la captura de Huawei Talent). Versión `cjc-version = "1.2.0"`, la de tu `cjpm.toml`.
2. Los proyectos 2 y 3 son tu código real del curso (13-nov-2026). El proyecto 4 aún no lo has hecho en la plataforma: su código es una **implementación de referencia** basada en el título de cada proyecto. Cuando completes cada proyecto en Huawei Talent, compara con las tareas reales y ajusta o reemplaza.
3. **No se inventan** evidencias ni certificado: `01-proyecto-1.png` ya está; las demás capturas y `certificado.pdf` deben salir de tu cuenta real.
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
    ├── certificado.pdf               (pendiente: descárgalo de Huawei Talent)
    ├── evidencias/
    │   ├── 00-ficha-del-curso.png    (incluido)
    │   ├── 01-proyecto-1.png         (incluido)
    │   ├── 02-proyecto-2.png         (incluido)
    │   ├── 03-proyecto-3.png         (incluido)
    │   ├── 04-proyecto-4.png         (pendiente)
    │   └── 05-examen-final.png       (pendiente)
    └── codigo/
        ├── proyecto-1/ (README.md, hola-cjc/main.cj, cjpmDemo/, cangjie/)
        ├── proyecto-2/ (README.md, tarea-2-1-consola/, tarea-2-2-guardar-logs/, tarea-2-3-filtrar-logs/ + log.txt)
        ├── proyecto-3/ (README.md, tarea-3-1-validacion/, tarea-3-2-gestion-dispositivos/, tarea-3-3-analisis-csv/ + CSV, tarea-3-4-funcional/ + CSV)
        └── proyecto-4/ (README.md, cjpm.toml, src/{descuentos,pedidos,optimizacion,main,negocio_test}.cj)
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
          - proyecto: proyecto-4
            entrada: ""
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
for t in proyecto-1/cjpmDemo proyecto-1/cangjie proyecto-2/tarea-2-1-consola proyecto-2/tarea-2-2-guardar-logs proyecto-2/tarea-2-3-filtrar-logs proyecto-3/tarea-3-1-validacion proyecto-3/tarea-3-2-gestion-dispositivos proyecto-3/tarea-3-3-analisis-csv proyecto-3/tarea-3-4-funcional proyecto-4; do
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
  "proyecto-4|"
)
for item in "${PROYECTOS[@]}"; do
  p="${item%%|*}"; entrada="${item#*|}"
  echo "==> $p"
  ( cd "$COD/$p" && cjpm build && printf "$entrada" | timeout 120 cjpm run && cjpm test )
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
    "proyecto-4"                         = ""
}
foreach ($p in $Proyectos.Keys) {
    Write-Host "==> $p"
    Push-Location (Join-Path $Cod $p)
    try {
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
| Fecha de finalización | *(pendiente)* |
| Nota del examen final | *(pendiente)* |
| Certificado | [certificado.pdf](certificado.pdf) |
| Ficha del curso | [00-ficha-del-curso.png](evidencias/00-ficha-del-curso.png) |

## Desarrollo del curso

| Proyecto | Fecha de término | Lo aprendido | Captura | Código |
|---|---|---|---|---|
| 1. Setting Up The Work Environment | 11 de noviembre de 2026 | Aprendí que el SDK de Cangjie es el paquete con el compilador, las librerías y las herramientas necesarias para programar en el lenguaje, y que hay que configurarlo con las variables de entorno para que el sistema lo reconozca. Entendí la diferencia entre `cjc`, que compila un archivo suelto, y `cjpm`, que crea y gestiona proyectos completos con su archivo `cjpm.toml`. Vi qué hace un IDE (editar, compilar, depurar y organizar todo en un solo lugar) y cómo la relación entre lenguaje y compilador hace que los dos evolucionen juntos. Hice el entorno en macOS, que al ser un sistema Unix funciona casi igual que Linux. | [01-proyecto-1.png](evidencias/01-proyecto-1.png) | [codigo/proyecto-1](codigo/proyecto-1/) |
| 2. Log File Management | 13 de noviembre de 2026 | Aprendí los tipos de datos básicos de Cangjie (enteros, decimales, booleanos y cadenas) y que hay que convertir los tipos explícitamente porque el lenguaje no mezcla tipos distintos en una operación. Practiqué leer datos de la consola y escribir logs en un archivo, usando `try` con recursos para que el archivo se cierre solo y `catch` para manejar errores como una entrada inválida. Usé `if`, `while` y `for-in` para armar menús que se repiten hasta que el usuario elige salir. Vi cómo definir funciones, sobrecargarlas (mismo nombre, distintos parámetros) y pasarles una lambda como último argumento para filtrar los logs por nivel. | [02-proyecto-2.png](evidencias/02-proyecto-2.png) | [codigo/proyecto-2](codigo/proyecto-2/) |
| 3. System Data Analysis | 13 de noviembre de 2026 | Aprendí a usar `enum` para limitar los valores posibles (como los distritos válidos) y `match` para cubrir todos los casos, algo más seguro que un `switch`. Entendí que `Option` (`?Int64`) reemplaza al `null` y obliga a decidir qué hacer cuando no hay valor, con `match`, `if-let` o `??`. Practiqué las colecciones (`Array`, `ArrayList`, `HashSet`, `HashMap`) y las tuplas para administrar una lista de dispositivos sin IDs repetidos. Leí un archivo CSV línea por línea, limpié los pagos fallidos y agrupé las ventas por región, producto y mes. Por último usé funciones de orden superior y el operador `\|>` para encadenar los pasos del análisis. | [03-proyecto-3.png](evidencias/03-proyecto-3.png) | [codigo/proyecto-3](codigo/proyecto-3/) |
| 4. Business Function Optimization | *(pendiente)* | *(pendiente)* | [04-proyecto-4.png](evidencias/04-proyecto-4.png) | [codigo/proyecto-4](codigo/proyecto-4/) |
| Examen final | *(pendiente)* | *(pendiente)* | [05-examen-final.png](evidencias/05-examen-final.png) | — |

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
    └── proyecto-4/   # business_opt: Strategy, HashSet/HashMap, memoización
```

## Tecnologías

- **Lenguaje:** Cangjie (Huawei), SDK 1.x
- **Herramientas:** `cjc` (compilador), `cjpm` (gestor de proyectos y pruebas), `std.unittest`
- **IDE:** VS Code con la extensión de Cangjie, o DevEco Studio con DevEco-Cangjie-Plugin
- **CI:** GitHub Actions (valida la estructura, compila, ejecuta y prueba cada proyecto)

## Cómo ejecutar

Requisito: Cangjie SDK instalado y `cjc -v` respondiendo en la terminal.

```bash
# Todos los proyectos (Linux, macOS o Git Bash en Windows), desde la raíz del repo
bash scripts/probar-todo.sh

# Un proyecto concreto
cd certification/codigo/proyecto-4
cjpm build && cjpm run && cjpm test
```

En Windows con PowerShell: `powershell -ExecutionPolicy Bypass -File scripts/probar-todo.ps1`.

## Relación con la asignatura

*(Borrador para personalizar)* Cangjie es el lenguaje de Huawei para el desarrollo de aplicaciones nativas
de HarmonyOS, un sistema operativo móvil. El curso conecta con Programación Móvil en tres frentes:
la preparación del entorno (SDK, IDE, emulador de dispositivo en DevEco Studio), las prácticas de
ingeniería que toda app móvil necesita (registro y análisis de logs, monitoreo de CPU y memoria,
que en un móvil impactan batería y fluidez) y la optimización de la lógica de negocio, donde
elegir la estructura de datos correcta reduce el trabajo del procesador en dispositivos con recursos limitados.
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

Refactorización y optimización de lógica de negocio de pedidos:

| Optimización | Antes | Después |
|---|---|---|
| Reglas de descuento | `if/else` acoplado | Patrón **Strategy** con `interface PoliticaDescuento` |
| Detección de pedidos duplicados | O(n²) con doble ciclo | O(n) con `HashSet` |
| Consulta de precios | Búsqueda lineal O(n) | Índice `HashMap` O(1) |
| Proyección de ventas | Recursión exponencial | Iteración O(n) |

Cada versión devuelve también el número de operaciones, de modo que la mejora se mide
de forma determinista (independiente de la velocidad del equipo) y se verifica en las pruebas.

| Archivo | Responsabilidad |
|---|---|
| `src/descuentos.cj` | Interfaz y políticas de descuento. |
| `src/pedidos.cj` | `LineaPedido`, `Pedido`, `mejorPolitica()`. |
| `src/optimizacion.cj` | Comparativas ingenuo vs optimizado. |
| `src/main.cj` | Demostración con métricas. |
| `src/negocio_test.cj` | Pruebas unitarias. |

```bash
cjpm build
cjpm run
cjpm test
```
````

## `certification/codigo/proyecto-4/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "business_opt"
  description = "Proyecto 4 - Business Function Optimization: refactorización y optimización de lógica de pedidos"
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

## `certification/codigo/proyecto-4/src/descuentos.cj`

```swift
package business_opt

// Patrón Strategy: cada política de descuento es intercambiable.
// Antes de optimizar, la lógica estaba en un único if/else gigante;
// con interfaces se puede agregar una política nueva sin tocar las existentes.
// Montos en pesos (Int64) para evitar errores de redondeo de Float64.

public interface PoliticaDescuento {
    func nombre(): String
    func aplicar(subtotal: Int64): Int64
}

public class SinDescuento <: PoliticaDescuento {
    public func nombre(): String {
        return "Sin descuento"
    }

    public func aplicar(subtotal: Int64): Int64 {
        return subtotal
    }
}

public class DescuentoPorcentaje <: PoliticaDescuento {
    private let porcentaje: Int64

    public init(porcentaje: Int64) {
        if (porcentaje < 0 || porcentaje > 100) {
            throw IllegalArgumentException("Porcentaje fuera de rango: ${porcentaje}")
        }
        this.porcentaje = porcentaje
    }

    public func nombre(): String {
        return "${porcentaje} % de descuento"
    }

    public func aplicar(subtotal: Int64): Int64 {
        return subtotal - subtotal * porcentaje / 100
    }
}

// 10 % solo si el subtotal alcanza el mínimo.
public class DescuentoPorVolumen <: PoliticaDescuento {
    private let minimo: Int64

    public init(minimo: Int64) {
        this.minimo = minimo
    }

    public func nombre(): String {
        return "10 % por compras desde ${minimo}"
    }

    public func aplicar(subtotal: Int64): Int64 {
        if (subtotal >= minimo) {
            return subtotal - subtotal / 10
        }
        return subtotal
    }
}
```

## `certification/codigo/proyecto-4/src/main.cj`

```swift
package business_opt

// Proyecto 4 · Business Function Optimization

main(): Int64 {
    println("=== Políticas de descuento (Strategy) ===")
    let pedido = Pedido(1001, "Andres")
    pedido.agregar(LineaPedido("Portátil", 2500000, 1)).agregar(LineaPedido("Mouse", 80000, 2))
    println("Subtotal: ${pedido.subtotal()}")

    let politicas: Array<PoliticaDescuento> = [
        SinDescuento(),
        DescuentoPorcentaje(5),
        DescuentoPorVolumen(2000000)
    ]
    for (p in politicas) {
        println("${p.nombre()}: ${pedido.total(p)}")
    }
    println("Mejor opción: ${mejorPolitica(pedido, politicas).nombre()}")

    println("\n=== Duplicados en 1000 IDs de pedidos ===")
    let ids = Array<Int64>(1000, {i => i % 800})
    let (d1, op1) = duplicadosIngenuo(ids)
    let (d2, op2) = duplicadosOptimizado(ids)
    println("Ingenuo O(n^2):    ${d1} duplicados, ${op1} comparaciones")
    println("Optimizado O(n):   ${d2} duplicados, ${op2} operaciones")

    println("\n=== Búsqueda de precios en catálogo de 500 productos ===")
    let catalogo = Catalogo()
    for (i in 0..500) {
        catalogo.registrar("P${i}", 1000 * (i + 1))
    }
    let (_, opLineal) = catalogo.precioLineal("P499")
    let (_, opIndice) = catalogo.precioIndexado("P499")
    println("Lineal: ${opLineal} operaciones | Indexado: ${opIndice} operación")

    println("\n=== Proyección de ventas (n = 30) ===")
    println("Recursiva:  ${proyeccionRecursiva(30)}")
    println("Memoizada:  ${proyeccionMemoizada(30)}")
    return 0
}
```

## `certification/codigo/proyecto-4/src/negocio_test.cj`

```swift
package business_opt

import std.unittest.*
import std.unittest.testmacro.*

@Test
class DescuentosTest {
    @TestCase
    func politicasBasicas(): Unit {
        @Expect(SinDescuento().aplicar(1000), 1000)
        @Expect(DescuentoPorcentaje(20).aplicar(1000), 800)
        @Expect(DescuentoPorVolumen(500).aplicar(1000), 900)
        @Expect(DescuentoPorVolumen(5000).aplicar(1000), 1000)
    }

    @TestCase
    func porcentajeInvalidoLanzaExcepcion(): Unit {
        @ExpectThrows[IllegalArgumentException](DescuentoPorcentaje(150))
    }

    @TestCase
    func totalYMejorPolitica(): Unit {
        let p = Pedido(1, "Cliente")
        p.agregar(LineaPedido("A", 1000, 3)).agregar(LineaPedido("B", 500, 2))
        @Expect(p.subtotal(), 4000)
        @Expect(p.total(DescuentoPorcentaje(25)), 3000)
        let politicas: Array<PoliticaDescuento> = [SinDescuento(), DescuentoPorcentaje(5), DescuentoPorVolumen(1000)]
        @Expect(mejorPolitica(p, politicas).nombre(), "10 % por compras desde 1000")
    }

    @TestCase
    func lineaInvalidaLanzaExcepcion(): Unit {
        @ExpectThrows[IllegalArgumentException](LineaPedido("X", 100, 0))
    }
}

@Test
class OptimizacionTest {
    @TestCase
    func ambasVersionesDanElMismoResultado(): Unit {
        let ids: Array<Int64> = [1, 2, 3, 2, 1, 4, 1]
        let (d1, op1) = duplicadosIngenuo(ids)
        let (d2, op2) = duplicadosOptimizado(ids)
        @Expect(d1, 3)
        @Expect(d2, 3)
        @Expect(op2, 7)
        @Expect(op1 > op2, true)
    }

    @TestCase
    func catalogoIndexadoEsConstante(): Unit {
        let c = Catalogo()
        c.registrar("A", 10)
        c.registrar("B", 20)
        c.registrar("C", 30)
        let (precio, opLineal) = c.precioLineal("C")
        let (precio2, opIndice) = c.precioIndexado("C")
        @Expect(precio.getOrThrow(), 30)
        @Expect(precio2.getOrThrow(), 30)
        @Expect(opLineal, 3)
        @Expect(opIndice, 1)
        let (faltante, _) = c.precioIndexado("Z")
        @Expect(faltante.isNone(), true)
    }

    @TestCase
    func proyeccionesCoinciden(): Unit {
        @Expect(proyeccionMemoizada(0), 0)
        @Expect(proyeccionMemoizada(10), 55)
        @Expect(proyeccionRecursiva(20), proyeccionMemoizada(20))
    }
}
```

## `certification/codigo/proyecto-4/src/optimizacion.cj`

```swift
package business_opt

import std.collection.*

// Comparación de versiones ingenua vs optimizada. Cada función devuelve
// (resultado, operaciones) para medir el costo de forma determinista,
// sin depender de la velocidad de la máquina.

// O(n^2): compara cada par de IDs.
public func duplicadosIngenuo(ids: Array<Int64>): (Int64, Int64) {
    var duplicados: Int64 = 0
    var operaciones: Int64 = 0
    var i: Int64 = 0
    while (i < ids.size) {
        var j: Int64 = 0
        var repetido = false
        while (j < i) {
            operaciones += 1
            if (ids[j] == ids[i]) {
                repetido = true
                break
            }
            j += 1
        }
        if (repetido) {
            duplicados += 1
        }
        i += 1
    }
    return (duplicados, operaciones)
}

// O(n): un HashSet recuerda los IDs ya vistos.
public func duplicadosOptimizado(ids: Array<Int64>): (Int64, Int64) {
    let vistos = HashSet<Int64>()
    var duplicados: Int64 = 0
    var operaciones: Int64 = 0
    for (id in ids) {
        operaciones += 1
        if (vistos.contains(id)) {
            duplicados += 1
            continue
        }
        vistos.add(id)
    }
    return (duplicados, operaciones)
}

// Catálogo de precios: búsqueda lineal O(n) vs índice HashMap O(1).
public class Catalogo {
    private let nombres = ArrayList<String>()
    private let precios = ArrayList<Int64>()
    private let indice = HashMap<String, Int64>()

    public func registrar(nombre: String, precio: Int64): Unit {
        nombres.add(nombre)
        precios.add(precio)
        indice[nombre] = precio
    }

    public func precioLineal(nombre: String): (Option<Int64>, Int64) {
        var operaciones: Int64 = 0
        var i: Int64 = 0
        while (i < nombres.size) {
            operaciones += 1
            if (nombres[i] == nombre) {
                return (Some(precios[i]), operaciones)
            }
            i += 1
        }
        return (None, operaciones)
    }

    public func precioIndexado(nombre: String): (Option<Int64>, Int64) {
        if (indice.contains(nombre)) {
            return (Some(indice[nombre]), 1)
        }
        return (None, 1)
    }
}

// Proyección de ventas acumuladas tipo Fibonacci: recursiva vs memoizada.
public func proyeccionRecursiva(n: Int64): Int64 {
    if (n <= 1) {
        return n
    }
    return proyeccionRecursiva(n - 1) + proyeccionRecursiva(n - 2)
}

public func proyeccionMemoizada(n: Int64): Int64 {
    if (n <= 1) {
        return n
    }
    var anterior: Int64 = 0
    var actual: Int64 = 1
    var i: Int64 = 2
    while (i <= n) {
        let siguiente = anterior + actual
        anterior = actual
        actual = siguiente
        i += 1
    }
    return actual
}
```

## `certification/codigo/proyecto-4/src/pedidos.cj`

```swift
package business_opt

import std.collection.*

public struct LineaPedido {
    public let producto: String
    public let precioUnitario: Int64
    public let cantidad: Int64

    public init(producto: String, precioUnitario: Int64, cantidad: Int64) {
        if (precioUnitario < 0 || cantidad <= 0) {
            throw IllegalArgumentException("Línea de pedido inválida: ${producto}")
        }
        this.producto = producto
        this.precioUnitario = precioUnitario
        this.cantidad = cantidad
    }

    public func subtotal(): Int64 {
        return precioUnitario * cantidad
    }
}

public class Pedido {
    public let id: Int64
    public let cliente: String
    private let lineas = ArrayList<LineaPedido>()

    public init(id: Int64, cliente: String) {
        this.id = id
        this.cliente = cliente
    }

    public func agregar(linea: LineaPedido): Pedido {
        lineas.add(linea)
        return this
    }

    public func subtotal(): Int64 {
        var s: Int64 = 0
        for (l in lineas) {
            s += l.subtotal()
        }
        return s
    }

    public func total(politica: PoliticaDescuento): Int64 {
        return politica.aplicar(subtotal())
    }
}

// Devuelve la política que deja el menor total para el cliente.
public func mejorPolitica(pedido: Pedido, politicas: Array<PoliticaDescuento>): PoliticaDescuento {
    if (politicas.size == 0) {
        throw IllegalArgumentException("Se necesita al menos una política")
    }
    var mejor = politicas[0]
    for (p in politicas) {
        if (pedido.total(p) < pedido.total(mejor)) {
            mejor = p
        }
    }
    return mejor
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
| Compilación real con SDK 1.2.1 | ✔ Windows: los 5 proyectos compilan con `cjpm build` y `hola-cjc` con `cjc`. Linux (SDK 1.2.1 x64): `scripts/probar-todo.sh` termina con código 0: build + run + **8/8 pruebas en verde** (cjpmDemo 1, proyecto-4 7); las tareas de los proyectos 2 y 3 se ejecutan con entrada simulada. |
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
- [ ] `evidencias/04-proyecto-4.png` + fila del proyecto 4
- [ ] `evidencias/05-examen-final.png` + nota del examen
- [ ] `certificado.pdf` descargado de Huawei Talent
- [ ] Código de proyectos 2–4 revisado contra las tareas reales del curso
- [ ] Sección "Relación con la asignatura" personalizada
- [ ] `STRICT=1 bash scripts/validar-certificacion.sh` → 0 errores
- [ ] Push hecho y workflow **Certificación Cangjie CI** en verde
