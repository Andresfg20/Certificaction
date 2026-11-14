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
