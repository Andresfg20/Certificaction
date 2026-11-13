package tarea_2_2_guardar_logs

import std.env.*
import std.fs.*
import std.time.*

// Escribe una línea al final del archivo y avisa en consola
func saveLog(file: File, event: String, message: String) {
    let line = "${DateTime.now()} INFO Event: ${event} Message: ${message}\n"
    file.write(line.toArray())
    println("Event: ${event} Message: ${message} guardado en log.txt")
}

main(): Int64 {
    while (true) {
        // try-with-resources: el archivo se cierra solo al terminar el bloque
        try (file = File(Path("log.txt"), Append)) {
            println("Seleccione el dato a guardar: [1] Control de acceso [2] Parqueadero [3] Video vigilancia [4] Cuarto de servidores [5] Salir")
            let input = getStdIn().readln().getOrThrow()

            if (input == "1") {
                saveLog(file, "Access Control", "Card Reader Fault")
            } else if (input == "2") {
                saveLog(file, "Parking Lot", "Available spaces 890/999")
            } else if (input == "3") {
                saveLog(file, "Video Surveillance", "Camera offline")
            } else if (input == "4") {
                saveLog(file, "Server Room Monitoring", "Temperature 25.3C Humidity 50.1%")
            } else if (input == "5") {
                println("Execution finished!")
                break
            } else {
                println("Opción inválida, intente de nuevo")
            }
        } catch (e: Exception) {
            println("Exception: ${e}")
            break
        }
    }
    return 0
}
