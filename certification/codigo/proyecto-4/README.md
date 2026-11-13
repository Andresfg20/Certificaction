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
