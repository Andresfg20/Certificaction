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
