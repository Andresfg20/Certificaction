package tarea_3_4_funcional

import std.collection.*
import std.env.*
import std.convert.*
import std.time.*
import std.fs.*
import std.io.*
import std.sort.*

type TradeType = (String, Int64, String, String, String, String, Float64, Int64, Float64, Bool)

let rawdata = ArrayList<TradeType>()

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

// Lectura en flujo: no carga todo el archivo en memoria
func parseLine(reader: StringReader<File>): Unit {
    var line = reader.readln()
    while (line.isSome()) {
        try {
            let fields = line.getOrThrow().split(",")
            if (fields.size < 10) {
                throw Exception("Campos insuficientes")
            }
            rawdata.add((fields[0], safeParseInt64(fields[1]), fields[2], fields[3], fields[4], fields[5],
                safeParseFloat64(fields[6]), safeParseInt64(fields[7]), safeParseFloat64(fields[8]),
                fields[9].contains("Success")))
        } catch (e: Exception) {
            println("Error en una fila: ${e}")
        }
        line = reader.readln()
    }
}

func readTradeFile(filename: String): Bool {
    try (fileStream = File(filename, OpenMode.Read)) {
        let start = DateTime.now()
        println("Leyendo archivo...")
        let reader = StringReader(fileStream)
        if (reader.readln().isNone()) {   // encabezado
            return false
        }
        parseLine(reader)
        let used = DateTime.now() - start
        println("Se procesaron ${rawdata.size} registros en ${used}")
        return true
    } catch (e: Exception) {
        println("No se pudo leer el archivo: ${e}")
        return false
    }
    // try con recursos es de tipo Unit: el return final le da a la función su tipo Bool
    return false
}

// Limpieza: solo transacciones con pago exitoso
let tradeSuccessFilter = filter<TradeType>({ trade => trade[9] })

// Suma cantidad y monto agrupando por la clave que entregue keyOf
func aggregate(trades: Iterator<TradeType>, keyOf: (TradeType) -> String): ArrayList<(String, Int64, Float64)> {
    let result = ArrayList<(String, Int64, Float64)>()
    for (trade in trades) {
        let key = keyOf(trade)
        var found = false
        for (i in 0..result.size) {
            if (result[i][0] == key) {
                result[i] = (key, result[i][1] + trade[7], result[i][2] + trade[8])
                found = true
            }
        }
        if (!found) {
            result.add((key, trade[7], trade[8]))
        }
    }
    return result
}

let analysisByLocation: (Iterator<TradeType>) -> ArrayList<(String, Int64, Float64)> = { trades =>
    aggregate(trades, { t => t[2] })
}

let analysisByGood: (Iterator<TradeType>) -> ArrayList<(String, Int64, Float64)> = { trades =>
    aggregate(trades, { t => t[5] })
}

// La fecha viene como yyyy-MM-dd: el mes es la parte del medio
let analysisByMonth: (Iterator<TradeType>) -> ArrayList<(String, Int64, Float64)> = { trades =>
    aggregate(trades, { t => "Mes " + t[0].split("-")[1] })
}

// Ordena de mayor a menor monto total
let sortFun: (ArrayList<(String, Int64, Float64)>) -> Array<(String, Int64, Float64)> = { stats =>
    sort<(String, Int64, Float64)>(stats, by: {a, b =>
        if (a[2] > b[2]) { Ordering.LT } else if (a[2] < b[2]) { Ordering.GT } else { Ordering.EQ }
    }, stable: true)
    stats.toArray()
}

let printResult: (Array<(String, Int64, Float64)>) -> Unit = { analysis =>
    println("========== Estadísticas ==========")
    if (analysis.size > 0) {
        let maxTotal = analysis[0][2]
        for (element in analysis) {
            println("${element[0]} Cantidad: ${element[1]} Total: ${element[2].format(".2")} RMB")
            println("|" * Int64(element[2] / maxTotal * 40.0))
        }
    }
}

main(): Int64 {
    let csvFilename = "./smart_retail_sales.csv"
    println("Leyendo transacciones...")
    if (!readTradeFile(csvFilename) || rawdata.size == 0) {
        println("Falló la lectura de datos.")
        return 1
    }
    println("Lectura exitosa, registros: ${rawdata.size}")
    while (true) {
        println("========== Procesamiento por lotes ==========")
        println("Menú: [1] Por región [2] Por producto [3] Por mes [4] Salir")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => rawdata |> tradeSuccessFilter |> analysisByLocation |> sortFun |> printResult
            case "2" => rawdata |> tradeSuccessFilter |> analysisByGood |> sortFun |> printResult
            case "3" => rawdata |> tradeSuccessFilter |> analysisByMonth |> sortFun |> printResult
            case "4" => break
            case _ => println("Comando inválido, intente de nuevo")
        }
    }
    return 0
}
