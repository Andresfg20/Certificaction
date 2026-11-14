package tarea_3_3_analisis_csv

import std.collection.*
import std.env.*
import std.convert.*
import std.time.*
import std.fs.*
import std.io.*
import std.sort.*

// fecha, id máquina, región, hora, id producto, producto, precio, cantidad, total, pago exitoso
type TradeType = (String, Int64, String, String, String, String, Float64, Int64, Float64, Bool)

let rawdata = ArrayList<TradeType>()   // datos crudos
let trades = ArrayList<TradeType>()    // datos limpios

func safeParseInt64(str: String, defaultValue!: Int64 = 0): Int64 {
    try {
        Int64.parse(str)
    } catch (e: Exception) {
        defaultValue
    }
}

func safeParseFloat64(str: String, defaultValue!: Float64 = 0.0): Float64 {
    try {
        Float64.parse(str)
    } catch (e: Exception) {
        defaultValue
    }
}

// Convierte los bytes del CSV en registros, línea por línea
func parseLine(bytes: Array<Byte>): Int64 {
    let stream = ByteBuffer()
    stream.write(bytes)
    let reader = StringReader(stream)
    if (reader.readln().isNone()) {   // salta el encabezado
        return 0
    }
    var count: Int64 = 0
    var line = reader.readln()
    while (line.isSome()) {
        try {
            let fields = line.getOrThrow().split(",")
            if (fields.size < 10) {
                throw Exception("Campos insuficientes")
            }
            let id = safeParseInt64(fields[1])
            let price = safeParseFloat64(fields[6])
            let num = safeParseInt64(fields[7])
            let total = safeParseFloat64(fields[8])
            let status = fields[9].contains("Success")
            rawdata.add((fields[0], id, fields[2], fields[3], fields[4], fields[5], price, num, total, status))
            count++
        } catch (e: Exception) {
            println("Error en una fila: ${e}")
        }
        line = reader.readln()
    }
    return count
}

func readTradeFile(filename: String): Bool {
    try {
        let bytes = File.readFrom(filename)
        let start = DateTime.now()
        let count = parseLine(bytes)
        let used = DateTime.now() - start
        println("Se procesaron ${count} registros en ${used}")
        return true
    } catch (e: Exception) {
        println("No se pudo leer el archivo: ${e}")
        return false
    }
}

// [1] Muestra los primeros 5 registros
func showSomeData() {
    println("Fecha\tID\tRegión\tHora\tProd.ID\tProducto\tPrecio\tCant.\tTotal\tPago")
    let n = if (rawdata.size < 5) { rawdata.size } else { 5 }
    for (i in 0..n) {
        let r = rawdata[i]
        println("${r[0]}\t${r[1]}\t${r[2]}\t${r[3]}\t${r[4]}\t${r[5]}\t${r[6].format(".2")}\t${r[7]}\t${r[8].format(".2")}\t${r[9]}")
    }
}

// [2] Limpieza: deja solo los pagos exitosos
func filterByPayStatus() {
    trades.clear()
    var success: Int64 = 0
    var failed: Int64 = 0
    for (data in rawdata) {
        if (data[9]) {
            success++
            trades.add(data)
        } else {
            failed++
        }
    }
    println("Total: ${rawdata.size} Exitosas: ${success} Fallidas: ${failed}")
}

// Suma cantidad y monto por región
func tradesByLocation(): ArrayList<(String, Int64, Float64)> {
    let result = ArrayList<(String, Int64, Float64)>()
    for (trade in trades) {
        var found = false
        for (i in 0..result.size) {
            if (result[i][0] == trade[2]) {
                result[i] = (result[i][0], result[i][1] + trade[7], result[i][2] + trade[8])
                found = true
            }
        }
        if (!found) {
            result.add((trade[2], trade[7], trade[8]))
        }
    }
    return result
}

// [3] Estadística por región, de mayor a menor monto, con barras
func analysisByLocation() {
    if (trades.size == 0) {
        println("Primero haga la limpieza de datos (opción 2)\n")
        return
    }
    let stats = tradesByLocation()
    // LT = "a va antes que b": así queda de mayor a menor
    sort<(String, Int64, Float64)>(stats, by: {a, b =>
        if (a[2] > b[2]) { Ordering.LT } else if (a[2] < b[2]) { Ordering.GT } else { Ordering.EQ }
    }, stable: true)
    println("========== Ventas por región ==========")
    let maxTotal = stats[0][2]   // el primero es el mayor
    for (s in stats) {
        let length = Int64(s[2] / maxTotal * 40.0)
        println("${s[0]} Cantidad: ${s[1]} Total: ${s[2].format(".2")} RMB")
        println("|" * length)
    }
}

main(): Int64 {
    let csvFilename = "./smart_retail_sales.csv"
    if (!readTradeFile(csvFilename)) {
        println("Falló la lectura de datos.")
        return 1
    }
    println("Lectura exitosa, registros: ${rawdata.size}")
    while (true) {
        println("========== Procesamiento por lotes ==========")
        println("Menú: [1] Mostrar datos [2] Limpiar datos [3] Estadística por región [4] Salir")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => showSomeData()
            case "2" => filterByPayStatus()
            case "3" => analysisByLocation()
            case "4" => break
            case _ => println("Comando inválido, intente de nuevo")
        }
    }
    return 0
}
