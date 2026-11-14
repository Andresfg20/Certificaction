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
