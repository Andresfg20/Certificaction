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
