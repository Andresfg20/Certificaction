package tarea_2_3_filtrar_logs

import std.env.*
import std.fs.*
import std.io.*

// Versión 1: si el comando es válido, filtra e imprime las líneas con el nivel
func parseCommand(input: String, valid: String, file: File, target: String): Bool {
    if (input == valid) {
        let log = StringReader(file)
        for (line in log.lines() where line.contains(target)) {
            println(line)
        }
        true
    } else {
        false
    }
}

// Versión 2 (sobrecarga): si el comando es válido, ejecuta la función recibida
func parseCommand(input: String, valid: String, callback: () -> Unit): Bool {
    if (input == valid) {
        callback()
        true
    } else {
        false
    }
}

main(): Int64 {
    while (true) {
        try (file = File(Path("./log.txt"), Read)) {
            println("Seleccione el nivel a filtrar: [1] trace [2] debug [3] info [4] warn [5] error [6] Salir")
            let input = getStdIn().readln().getOrThrow()

            if (parseCommand(input, "1", file, "TRACE")) { continue }
            if (parseCommand(input, "2", file, "DEBUG")) { continue }
            if (parseCommand(input, "3", file, "INFO")) { continue }
            if (parseCommand(input, "4", file, "WARN")) { continue }
            if (parseCommand(input, "5", file, "ERROR")) { continue }
            // Lambda al final: solo imprime; el break se hace fuera de la lambda
            if (parseCommand(input, "6") { println("Operation ended") }) { break }

            println("Please select again!")
        } catch (e: Exception) {
            println("System exception: ${e}")
            break
        }
    }
    return 0
}
