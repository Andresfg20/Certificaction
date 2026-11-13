package tarea_2_1_consola

import std.env.*
import std.convert.*
import std.time.*

// Imprime una línea de log: fecha y hora, nivel, evento y mensaje
func logInfo(event: String, message: String) {
    println("${DateTime.now()} INFO ${event} ${message}")
}

main(): Int64 {
    println("Ingrese el nombre del campus:")
    let campusName: String = getStdIn().readln().getOrThrow()

    println("Ingrese el número de edificios:")
    let buildingNum: Int64 = Int64.parse(getStdIn().readln().getOrThrow())

    println("Ingrese el área construida (miles de metros cuadrados):")
    let buildingArea: Float64 = Float64.parse(getStdIn().readln().getOrThrow())

    println("¿Es un campus inteligente? (yes/no):")
    let isSmartCampus: Bool = getStdIn().readln().getOrThrow() == "yes"

    var message = "Message: "
    message += "Campus: ${campusName} "
    message += "Edificios: ${buildingNum} "
    message += "Área: ${buildingArea.format(".1")} miles de m2 "
    message += "Campus inteligente: ${isSmartCampus}"

    logInfo("Event: Entry operation", message)
    // Pregunta del curso: latitud y longitud irían en Float64 (tienen decimales)
    return 0
}
