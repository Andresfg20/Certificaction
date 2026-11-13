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
