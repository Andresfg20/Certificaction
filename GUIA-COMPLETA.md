# Guía completa · Certificación Cangjie Programming (Huawei ICT Academy)

> Todo lo de esta guía ya está creado en la carpeta `LISTO-PARA-REPO/`. Copia **su contenido** (incluidos los archivos ocultos `.github`, `.gitignore`, etc.) a la raíz de tu repositorio, al mismo nivel que `01-week … 16-week`.

# Resumen del Proyecto

Repositorio de evidencias de la certificación **Cangjie Programming** (Huawei Talent · ICT Academy, 56 h) para el Corte 3 de Programación Móvil. La carpeta `certification/` vive en la raíz del repositorio y contiene el README con la ficha y el avance, el certificado, las capturas de evidencia y el código de los 4 proyectos del curso:

| Proyecto | Paquete cjpm | Contenido |
|---|---|---|
| 1 · Setting Up The Work Environment | `hola-cjc`, `cjpmDemo`, `cangjie` | Tu código original (cjc vs cjpm) + prueba unitaria añadida a `cjpmDemo`. |
| 2 · Log File Management | `log_manager` | Parser de logs con `Option`, conteo por nivel, filtros, búsqueda y rotación. |
| 3 · System Data Analysis | `data_analysis` | CSV de CPU/memoria, estadísticas, media móvil y anomalías. |
| 4 · Business Function Optimization | `business_opt` | Strategy para descuentos, O(n²)→O(n) con HashSet, HashMap, memoización. |

**Supuestos tomados**
1. Lenguaje: **Cangjie** (SDK 1.2.1 instalado y validado en tu equipo) (detectado por `cjpm.toml`, `.cj` y la captura de Huawei Talent). Versión `cjc-version = "1.2.0"`, la de tu `cjpm.toml`.
2. Los proyectos 2–4 aún no los has hecho en la plataforma: su código es una **implementación de referencia** basada en el título de cada proyecto. Cuando completes cada proyecto en Huawei Talent, compara con las tareas reales y ajusta o reemplaza.
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
    │   ├── 00-ficha-del-curso.png    (pendiente)
    │   ├── 01-proyecto-1.png         (incluido)
    │   ├── 02-proyecto-2.png         (pendiente)
    │   ├── 03-proyecto-3.png         (pendiente)
    │   ├── 04-proyecto-4.png         (pendiente)
    │   └── 05-examen-final.png       (pendiente)
    └── codigo/
        ├── proyecto-1/ (README.md, hola-cjc/main.cj, cjpmDemo/, cangjie/)
        ├── proyecto-2/ (README.md, cjpm.toml, src/{log_entry,gestor_logs,main,log_test}.cj)
        ├── proyecto-3/ (README.md, cjpm.toml, src/{muestras,estadisticas,main,estadisticas_test}.cj)
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
        proyecto:
          - proyecto-1/cjpmDemo
          - proyecto-1/cangjie
          - proyecto-2
          - proyecto-3
          - proyecto-4
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
      - name: Run
        run: cjpm run
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
for t in proyecto-1/cjpmDemo proyecto-1/cangjie proyecto-2 proyecto-3 proyecto-4; do
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

for p in proyecto-1/cjpmDemo proyecto-1/cangjie proyecto-2 proyecto-3 proyecto-4; do
  echo "==> $p"
  ( cd "$COD/$p" && cjpm build && cjpm run && cjpm test )
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

foreach ($p in @("proyecto-1\cjpmDemo", "proyecto-1\cangjie", "proyecto-2", "proyecto-3", "proyecto-4")) {
    Write-Host "==> $p"
    Push-Location (Join-Path $Cod $p)
    try {
        Invoke-Paso "cjpm build"
        Invoke-Paso "cjpm run"
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

## `certification/README.md`

````markdown
# Certificación Corte 3 · Cangjie Programming (Huawei ICT Academy)

[![Certificación Cangjie CI](../../actions/workflows/certification-ci.yml/badge.svg)](../../actions/workflows/certification-ci.yml)

## Ficha

| Dato | Detalle |
|---|---|
| Nombre completo | Andres Felipe Gomez Anacona |
| Usuario de GitHub | *(tu usuario)* |
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
| 2. Log File Management | *(pendiente)* | *(pendiente)* | [02-proyecto-2.png](evidencias/02-proyecto-2.png) | [codigo/proyecto-2](codigo/proyecto-2/) |
| 3. System Data Analysis | *(pendiente)* | *(pendiente)* | [03-proyecto-3.png](evidencias/03-proyecto-3.png) | [codigo/proyecto-3](codigo/proyecto-3/) |
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
    ├── proyecto-2/   # log_manager: parser, filtros y rotación de logs
    ├── proyecto-3/   # data_analysis: estadísticas y anomalías de CPU/memoria
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
cd certification/codigo/proyecto-2
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

Gestor de logs en Cangjie: interpreta líneas con formato
`AAAA-MM-DD HH:MM:SS [NIVEL] modulo: mensaje`, descarta líneas corruptas sin detenerse,
cuenta por nivel, filtra por nivel o módulo, busca texto y simula la rotación de archivos.

| Archivo | Responsabilidad |
|---|---|
| `src/log_entry.cj` | `struct LogEntry` y `parsearLinea()` (devuelve `Option`). |
| `src/gestor_logs.cj` | `class GestorLogs`: carga, conteo, filtros, búsqueda, rotación y resumen. |
| `src/main.cj` | Demostración con datos de ejemplo embebidos. |
| `src/log_test.cj` | Pruebas unitarias (`std.unittest`). |

Conceptos de Cangjie: `struct`, `class`, `Option<T>` + `match`, `ArrayList`, interpolación de strings, excepciones.

```bash
cjpm build
cjpm run
cjpm test
```
````

## `certification/codigo/proyecto-2/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "log_manager"
  description = "Proyecto 2 - Log File Management: análisis, filtrado y rotación de logs"
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

## `certification/codigo/proyecto-2/src/gestor_logs.cj`

```swift
package log_manager

import std.collection.*

// Carga, consulta, filtra y rota entradas de log en memoria.
public class GestorLogs {
    private let entradas = ArrayList<LogEntry>()
    private var lineasInvalidas: Int64 = 0

    public func cargar(texto: String): Unit {
        for (linea in texto.split("\n")) {
            if (linea.trimAscii().isEmpty()) {
                continue
            }
            match (parsearLinea(linea)) {
                case Some(e) => entradas.add(e)
                case None => lineasInvalidas += 1
            }
        }
    }

    public func total(): Int64 {
        return entradas.size
    }

    public func invalidas(): Int64 {
        return lineasInvalidas
    }

    public func contarPorNivel(nivel: String): Int64 {
        var n: Int64 = 0
        for (e in entradas) {
            if (e.nivel == nivel) {
                n += 1
            }
        }
        return n
    }

    public func filtrarPorNivel(nivel: String): ArrayList<LogEntry> {
        let r = ArrayList<LogEntry>()
        for (e in entradas) {
            if (e.nivel == nivel) {
                r.add(e)
            }
        }
        return r
    }

    public func filtrarPorModulo(modulo: String): ArrayList<LogEntry> {
        let r = ArrayList<LogEntry>()
        for (e in entradas) {
            if (e.modulo == modulo) {
                r.add(e)
            }
        }
        return r
    }

    public func buscar(palabra: String): ArrayList<LogEntry> {
        let r = ArrayList<LogEntry>()
        for (e in entradas) {
            if (e.mensaje.contains(palabra)) {
                r.add(e)
            }
        }
        return r
    }

    // Simula la rotación de archivos de log: divide las entradas en bloques
    // de como máximo `maxPorArchivo` líneas (app.log.1, app.log.2, ...).
    public func rotar(maxPorArchivo: Int64): ArrayList<ArrayList<LogEntry>> {
        if (maxPorArchivo <= 0) {
            throw IllegalArgumentException("maxPorArchivo debe ser mayor que 0")
        }
        let archivos = ArrayList<ArrayList<LogEntry>>()
        var actual = ArrayList<LogEntry>()
        for (e in entradas) {
            actual.add(e)
            if (actual.size == maxPorArchivo) {
                archivos.add(actual)
                actual = ArrayList<LogEntry>()
            }
        }
        if (actual.size > 0) {
            archivos.add(actual)
        }
        return archivos
    }

    public func resumen(): String {
        var s = "=== Resumen de logs ===\n"
        s += "Entradas válidas: ${total()}\n"
        s += "Líneas inválidas: ${invalidas()}\n"
        for (nivel in NIVELES_VALIDOS) {
            s += "  ${nivel}: ${contarPorNivel(nivel)}\n"
        }
        return s
    }
}
```

## `certification/codigo/proyecto-2/src/log_entry.cj`

```swift
package log_manager

// Modelo de una línea de log y su parser.
// Formato esperado:  2026-11-12 08:00:01 [ERROR] auth: Contraseña inválida

let NIVELES_VALIDOS: Array<String> = ["DEBUG", "INFO", "WARN", "ERROR"]

public struct LogEntry <: ToString {
    public let fecha: String
    public let hora: String
    public let nivel: String
    public let modulo: String
    public let mensaje: String

    public init(fecha: String, hora: String, nivel: String, modulo: String, mensaje: String) {
        this.fecha = fecha
        this.hora = hora
        this.nivel = nivel
        this.modulo = modulo
        this.mensaje = mensaje
    }

    public func toString(): String {
        return "${fecha} ${hora} [${nivel}] ${modulo}: ${mensaje}"
    }
}

public func esNivelValido(nivel: String): Bool {
    for (n in NIVELES_VALIDOS) {
        if (n == nivel) {
            return true
        }
    }
    return false
}

// Devuelve None si la línea no cumple el formato (en vez de lanzar excepción),
// así una línea corrupta no detiene el procesamiento del archivo completo.
public func parsearLinea(linea: String): Option<LogEntry> {
    let texto = linea.trimAscii()
    if (texto.isEmpty()) {
        return None
    }
    let posAbre = match (texto.indexOf("[")) {
        case Some(v) => v
        case None => return None
    }
    let posCierra = match (texto.indexOf("]")) {
        case Some(v) => v
        case None => return None
    }
    if (posCierra <= posAbre) {
        return None
    }
    let cabecera = texto[0..posAbre].trimAscii()
    let nivel = texto[(posAbre + 1)..posCierra].trimAscii()
    let resto = texto[(posCierra + 1)..texto.size].trimAscii()

    let partesCabecera = cabecera.split(" ", removeEmpty: true)
    if (partesCabecera.size != 2 || !esNivelValido(nivel)) {
        return None
    }
    let posDosPuntos = match (resto.indexOf(":")) {
        case Some(v) => v
        case None => return None
    }
    let modulo = resto[0..posDosPuntos].trimAscii()
    let mensaje = resto[(posDosPuntos + 1)..resto.size].trimAscii()
    if (modulo.isEmpty()) {
        return None
    }
    return Some(LogEntry(partesCabecera[0], partesCabecera[1], nivel, modulo, mensaje))
}
```

## `certification/codigo/proyecto-2/src/log_test.cj`

```swift
package log_manager

import std.unittest.*
import std.unittest.testmacro.*

let DATOS_PRUEBA: String = """
2026-11-12 08:00:01 [INFO] server: Inicio
2026-11-12 08:00:02 [ERROR] auth: Fallo de login
2026-11-12 08:00:03 [ERROR] db: Conexión perdida
2026-11-12 08:00:04 [WARN] db: Consulta lenta
basura
2026-11-12 08:00:05 [FATAL] x: nivel no soportado
"""

@Test
class ParserTest {
    @TestCase
    func parseaLineaValida(): Unit {
        match (parsearLinea("2026-11-12 08:00:01 [INFO] server: Servicio iniciado")) {
            case Some(e) =>
                @Expect(e.fecha, "2026-11-12")
                @Expect(e.hora, "08:00:01")
                @Expect(e.nivel, "INFO")
                @Expect(e.modulo, "server")
                @Expect(e.mensaje, "Servicio iniciado")
            case None => @Expect(false, true)
        }
    }

    @TestCase
    func toleraRetornoDeCarroDeWindows(): Unit {
        @Expect(parsearLinea("2026-11-12 08:00:01 [WARN] db: lento\r").isSome(), true)
    }

    @TestCase
    func rechazaLineasInvalidas(): Unit {
        @Expect(parsearLinea("").isNone(), true)
        @Expect(parsearLinea("sin corchetes").isNone(), true)
        @Expect(parsearLinea("2026-11-12 08:00:01 [TRACE] a: b").isNone(), true)
        @Expect(parsearLinea("2026-11-12 08:00:01 [INFO] sin dos puntos").isNone(), true)
    }
}

@Test
class GestorLogsTest {
    @TestCase
    func cuentaValidasEInvalidas(): Unit {
        let g = GestorLogs()
        g.cargar(DATOS_PRUEBA)
        @Expect(g.total(), 4)
        @Expect(g.invalidas(), 2)
    }

    @TestCase
    func cuentaYFiltraPorNivel(): Unit {
        let g = GestorLogs()
        g.cargar(DATOS_PRUEBA)
        @Expect(g.contarPorNivel("ERROR"), 2)
        @Expect(g.contarPorNivel("DEBUG"), 0)
        @Expect(g.filtrarPorNivel("WARN").size, 1)
    }

    @TestCase
    func filtraPorModuloYBusca(): Unit {
        let g = GestorLogs()
        g.cargar(DATOS_PRUEBA)
        @Expect(g.filtrarPorModulo("db").size, 2)
        @Expect(g.buscar("login").size, 1)
    }

    @TestCase
    func rotaEnBloques(): Unit {
        let g = GestorLogs()
        g.cargar(DATOS_PRUEBA)
        let archivos = g.rotar(3)
        @Expect(archivos.size, 2)
        @Expect(archivos[0].size, 3)
        @Expect(archivos[1].size, 1)
    }
}
```

## `certification/codigo/proyecto-2/src/main.cj`

```swift
package log_manager

// Proyecto 2 · Log File Management
// Los datos de ejemplo están embebidos para que el programa sea reproducible
// en cualquier sistema operativo sin depender de rutas de archivos.

let LOG_DE_EJEMPLO: String = """
2026-11-12 08:00:01 [INFO] server: Servicio iniciado en el puerto 8080
2026-11-12 08:00:05 [DEBUG] db: Pool de conexiones creado con 10 conexiones
2026-11-12 08:01:12 [INFO] auth: Usuario andres inició sesión
2026-11-12 08:02:40 [WARN] db: Consulta lenta de 1200 ms en pedidos
2026-11-12 08:03:15 [ERROR] auth: Contraseña inválida para usuario invitado
linea corrupta sin formato
2026-11-12 08:04:00 [ERROR] server: Tiempo de espera agotado en /api/pedidos
2026-11-12 08:05:30 [INFO] server: Petición GET /api/productos atendida en 35 ms
2026-11-12 08:06:45 [WARN] server: Uso de memoria al 85 por ciento
"""

main(): Int64 {
    let gestor = GestorLogs()
    gestor.cargar(LOG_DE_EJEMPLO)
    print(gestor.resumen())

    println("\n=== Solo errores ===")
    for (e in gestor.filtrarPorNivel("ERROR")) {
        println(e.toString())
    }

    println("\n=== Módulo db ===")
    for (e in gestor.filtrarPorModulo("db")) {
        println(e.toString())
    }

    println("\n=== Búsqueda: mensajes que contienen 'ms' ===")
    for (e in gestor.buscar("ms")) {
        println(e.toString())
    }

    println("\n=== Rotación (máx. 3 líneas por archivo) ===")
    var i: Int64 = 1
    for (archivo in gestor.rotar(3)) {
        println("app.log.${i}: ${archivo.size} líneas")
        i += 1
    }
    return 0
}
```

## `certification/codigo/proyecto-3/README.md`

````markdown
# Proyecto 3 · System Data Analysis

Análisis de muestras de monitoreo (CPU y memoria en %) leídas desde CSV:
mínimo, máximo, promedio, mediana, desviación estándar, media móvil y detección de anomalías por umbral.

| Archivo | Responsabilidad |
|---|---|
| `src/muestras.cj` | `struct Muestra`, `parsearCsv()` con validación, extracción de columnas. |
| `src/estadisticas.cj` | Funciones estadísticas puras + ordenamiento por inserción. |
| `src/main.cj` | Reporte con datos de ejemplo (incluye una fila inválida a propósito). |
| `src/estadisticas_test.cj` | Pruebas unitarias, incluidas las de excepciones. |

Conceptos de Cangjie: `Array` vs `ArrayList`, `Float64`, `std.math`, `std.convert` (`Int64.tryParse`), tuplas en `match`, excepciones.

```bash
cjpm build
cjpm run
cjpm test
```
````

## `certification/codigo/proyecto-3/cjpm.toml`

```toml
[package]
  cjc-version = "1.2.0"
  name = "data_analysis"
  description = "Proyecto 3 - System Data Analysis: estadísticas y anomalías de CPU y memoria"
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

## `certification/codigo/proyecto-3/src/estadisticas.cj`

```swift
package data_analysis

import std.collection.*
import std.math.*

// Funciones estadísticas puras sobre series de enteros (porcentajes 0-100).
// Todas validan la entrada y lanzan IllegalArgumentException si la serie está vacía.

func validarNoVacio(valores: Array<Int64>): Unit {
    if (valores.size == 0) {
        throw IllegalArgumentException("La serie de datos no puede estar vacía")
    }
}

public func minimo(valores: Array<Int64>): Int64 {
    validarNoVacio(valores)
    var m = valores[0]
    for (v in valores) {
        if (v < m) {
            m = v
        }
    }
    return m
}

public func maximo(valores: Array<Int64>): Int64 {
    validarNoVacio(valores)
    var m = valores[0]
    for (v in valores) {
        if (v > m) {
            m = v
        }
    }
    return m
}

public func promedio(valores: Array<Int64>): Float64 {
    validarNoVacio(valores)
    var suma: Int64 = 0
    for (v in valores) {
        suma += v
    }
    return Float64(suma) / Float64(valores.size)
}

public func desviacionEstandar(valores: Array<Int64>): Float64 {
    let media = promedio(valores)
    var acumulado: Float64 = 0.0
    for (v in valores) {
        let d = Float64(v) - media
        acumulado += d * d
    }
    return sqrt(acumulado / Float64(valores.size))
}

// Ordenamiento por inserción sobre una copia: no modifica la serie original.
public func ordenar(valores: Array<Int64>): Array<Int64> {
    let copia = valores.clone()
    var i: Int64 = 1
    while (i < copia.size) {
        let actual = copia[i]
        var j = i - 1
        while (j >= 0 && copia[j] > actual) {
            copia[j + 1] = copia[j]
            j -= 1
        }
        copia[j + 1] = actual
        i += 1
    }
    return copia
}

public func mediana(valores: Array<Int64>): Float64 {
    validarNoVacio(valores)
    let o = ordenar(valores)
    let n = o.size
    if (n % 2 == 1) {
        return Float64(o[n / 2])
    }
    return Float64(o[n / 2 - 1] + o[n / 2]) / 2.0
}

// Media móvil simple con ventana fija; devuelve n - ventana + 1 valores.
public func mediaMovil(valores: Array<Int64>, ventana: Int64): ArrayList<Float64> {
    if (ventana <= 0 || ventana > valores.size) {
        throw IllegalArgumentException("Ventana inválida: ${ventana}")
    }
    let r = ArrayList<Float64>()
    var suma: Int64 = 0
    var i: Int64 = 0
    while (i < valores.size) {
        suma += valores[i]
        if (i >= ventana) {
            suma -= valores[i - ventana]
        }
        if (i >= ventana - 1) {
            r.add(Float64(suma) / Float64(ventana))
        }
        i += 1
    }
    return r
}

// Índices de las muestras que superan el umbral.
public func anomalias(valores: Array<Int64>, umbral: Int64): ArrayList<Int64> {
    let r = ArrayList<Int64>()
    var i: Int64 = 0
    while (i < valores.size) {
        if (valores[i] > umbral) {
            r.add(i)
        }
        i += 1
    }
    return r
}
```

## `certification/codigo/proyecto-3/src/estadisticas_test.cj`

```swift
package data_analysis

import std.unittest.*
import std.unittest.testmacro.*
import std.math.*

func casiIgual(a: Float64, b: Float64): Bool {
    return abs(a - b) < 0.0001
}

@Test
class EstadisticasTest {
    let serie: Array<Int64> = [10, 40, 20, 30]

    @TestCase
    func minimoYMaximo(): Unit {
        @Expect(minimo(serie), 10)
        @Expect(maximo(serie), 40)
    }

    @TestCase
    func promedioYMediana(): Unit {
        @Expect(casiIgual(promedio(serie), 25.0), true)
        @Expect(casiIgual(mediana(serie), 25.0), true)
        @Expect(casiIgual(mediana([5, 1, 3]), 3.0), true)
    }

    @TestCase
    func desviacion(): Unit {
        // Población: sqrt(((15^2)+(15^2)+(5^2)+(5^2))/4) = sqrt(125)
        @Expect(casiIgual(desviacionEstandar(serie), sqrt(125.0)), true)
    }

    @TestCase
    func ordenarNoModificaOriginal(): Unit {
        let o = ordenar(serie)
        @Expect(o[0], 10)
        @Expect(o[3], 40)
        @Expect(serie[1], 40)
    }

    @TestCase
    func mediaMovilVentana2(): Unit {
        let m = mediaMovil(serie, 2)
        @Expect(m.size, 3)
        @Expect(casiIgual(m[0], 25.0), true)
        @Expect(casiIgual(m[2], 25.0), true)
    }

    @TestCase
    func detectaAnomalias(): Unit {
        let a = anomalias(serie, 25)
        @Expect(a.size, 2)
        @Expect(a[0], 1)
        @Expect(a[1], 3)
    }

    @TestCase
    func serieVaciaLanzaExcepcion(): Unit {
        let vacia: Array<Int64> = []
        @ExpectThrows[IllegalArgumentException](minimo(vacia))
        @ExpectThrows[IllegalArgumentException](mediaMovil(serie, 0))
    }
}

@Test
class CsvTest {
    @TestCase
    func descartaFilasInvalidas(): Unit {
        let m = parsearCsv("hora,cpu,memoria\n08:00,10,20\n08:05,x,20\n08:10,150,20\n08:15,30\n08:20,40,50\r\n")
        @Expect(m.size, 2)
        @Expect(m[1].hora, "08:20")
        @Expect(columnaCpu(m)[1], 40)
        @Expect(columnaMemoria(m)[0], 20)
    }
}
```

## `certification/codigo/proyecto-3/src/main.cj`

```swift
package data_analysis

// Proyecto 3 · System Data Analysis

let CSV_DE_EJEMPLO: String = """
hora,cpu,memoria
08:00,35,60
08:05,42,61
08:10,38,63
08:15,91,70
08:20,47,72
08:25,55,74
08:30,95,88
08:35,40,76
08:40,abc,70
08:45,36,65
"""

let UMBRAL_CPU: Int64 = 90
let UMBRAL_MEMORIA: Int64 = 85

func reportar(nombre: String, serie: Array<Int64>): Unit {
    println("--- ${nombre} ---")
    println("Mínimo: ${minimo(serie)} %")
    println("Máximo: ${maximo(serie)} %")
    println("Promedio: ${promedio(serie)} %")
    println("Mediana: ${mediana(serie)} %")
    println("Desviación estándar: ${desviacionEstandar(serie)}")
}

main(): Int64 {
    let muestras = parsearCsv(CSV_DE_EJEMPLO)
    println("Muestras válidas: ${muestras.size}")

    let cpu = columnaCpu(muestras)
    let mem = columnaMemoria(muestras)
    reportar("CPU", cpu)
    reportar("Memoria", mem)

    println("\n--- Media móvil de CPU (ventana 3) ---")
    for (v in mediaMovil(cpu, 3)) {
        println(v)
    }

    println("\n--- Alertas ---")
    for (i in anomalias(cpu, UMBRAL_CPU)) {
        println("CPU alta a las ${muestras[i].hora}: ${cpu[i]} %")
    }
    for (i in anomalias(mem, UMBRAL_MEMORIA)) {
        println("Memoria alta a las ${muestras[i].hora}: ${mem[i]} %")
    }
    return 0
}
```

## `certification/codigo/proyecto-3/src/muestras.cj`

```swift
package data_analysis

import std.collection.*
import std.convert.*

// Una muestra de monitoreo del sistema tomada en una hora concreta.
public struct Muestra {
    public let hora: String
    public let cpu: Int64
    public let memoria: Int64

    public init(hora: String, cpu: Int64, memoria: Int64) {
        this.hora = hora
        this.cpu = cpu
        this.memoria = memoria
    }
}

func aEntero(texto: String): Option<Int64> {
    return Int64.tryParse(texto.trimAscii())
}

// Interpreta CSV "hora,cpu,memoria". Ignora la cabecera, líneas vacías y
// filas con valores no numéricos o fuera del rango 0-100.
public func parsearCsv(texto: String): ArrayList<Muestra> {
    let r = ArrayList<Muestra>()
    for (linea in texto.split("\n")) {
        let l = linea.trimAscii()
        if (l.isEmpty() || l.startsWith("hora")) {
            continue
        }
        let c = l.split(",")
        if (c.size != 3) {
            continue
        }
        match ((aEntero(c[1]), aEntero(c[2]))) {
            case (Some(cpu), Some(mem)) =>
                if (cpu >= 0 && cpu <= 100 && mem >= 0 && mem <= 100) {
                    r.add(Muestra(c[0].trimAscii(), cpu, mem))
                }
            case _ => ()
        }
    }
    return r
}

public func columnaCpu(muestras: ArrayList<Muestra>): Array<Int64> {
    let r = ArrayList<Int64>()
    for (m in muestras) {
        r.add(m.cpu)
    }
    return r.toArray()
}

public func columnaMemoria(muestras: ArrayList<Muestra>): Array<Int64> {
    let r = ArrayList<Int64>()
    for (m in muestras) {
        r.add(m.memoria)
    }
    return r.toArray()
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
| Compilación real con SDK 1.2.1 | ✔ Windows: los 5 proyectos compilan con `cjpm build` y `hola-cjc` con `cjc`. Linux (SDK 1.2.1 x64): `scripts/probar-todo.sh` termina con código 0: build + run + **23/23 pruebas en verde** (cjpmDemo 1, proyecto-2 7, proyecto-3 8, proyecto-4 7). |
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
- [ ] Usuario de GitHub escrito en `certification/README.md`
- [ ] `evidencias/00-ficha-del-curso.png` (captura de la ficha del curso)
- [x] `evidencias/01-proyecto-1.png`
- [ ] `evidencias/02-proyecto-2.png` + fila del proyecto 2 en el README
- [ ] `evidencias/03-proyecto-3.png` + fila del proyecto 3
- [ ] `evidencias/04-proyecto-4.png` + fila del proyecto 4
- [ ] `evidencias/05-examen-final.png` + nota del examen
- [ ] `certificado.pdf` descargado de Huawei Talent
- [ ] Código de proyectos 2–4 revisado contra las tareas reales del curso
- [ ] Sección "Relación con la asignatura" personalizada
- [ ] `STRICT=1 bash scripts/validar-certificacion.sh` → 0 errores
- [ ] Push hecho y workflow **Certificación Cangjie CI** en verde
