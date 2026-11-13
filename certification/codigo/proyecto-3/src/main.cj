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
