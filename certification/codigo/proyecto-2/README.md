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
