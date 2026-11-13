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
  "proyecto-3|"
  "proyecto-4|"
)
for item in "${PROYECTOS[@]}"; do
  p="${item%%|*}"; entrada="${item#*|}"
  echo "==> $p"
  ( cd "$COD/$p" && cjpm build && printf "$entrada" | cjpm run && cjpm test )
done
echo "Todos los proyectos compilaron, ejecutaron y pasaron sus pruebas."
