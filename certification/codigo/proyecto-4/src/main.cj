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
