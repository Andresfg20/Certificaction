package log_manager

import std.collection.*

// Carga, consulta, filtra y rota entradas de log en memoria.
public class GestorLogs {
    private let entradas = ArrayList<LogEntry>()
    private var lineasInvalidas: Int64 = 0

    public func cargar(texto: String): Unit {
        for (linea in texto.split("\n")) {
            if (linea.trimAscii().isEmpty()) {
                continue
            }
            match (parsearLinea(linea)) {
                case Some(e) => entradas.add(e)
                case None => lineasInvalidas += 1
            }
        }
    }

    public func total(): Int64 {
        return entradas.size
    }

    public func invalidas(): Int64 {
        return lineasInvalidas
    }

    public func contarPorNivel(nivel: String): Int64 {
        var n: Int64 = 0
        for (e in entradas) {
            if (e.nivel == nivel) {
                n += 1
            }
        }
        return n
    }

    public func filtrarPorNivel(nivel: String): ArrayList<LogEntry> {
        let r = ArrayList<LogEntry>()
        for (e in entradas) {
            if (e.nivel == nivel) {
                r.add(e)
            }
        }
        return r
    }

    public func filtrarPorModulo(modulo: String): ArrayList<LogEntry> {
        let r = ArrayList<LogEntry>()
        for (e in entradas) {
            if (e.modulo == modulo) {
                r.add(e)
            }
        }
        return r
    }

    public func buscar(palabra: String): ArrayList<LogEntry> {
        let r = ArrayList<LogEntry>()
        for (e in entradas) {
            if (e.mensaje.contains(palabra)) {
                r.add(e)
            }
        }
        return r
    }

    // Simula la rotación de archivos de log: divide las entradas en bloques
    // de como máximo `maxPorArchivo` líneas (app.log.1, app.log.2, ...).
    public func rotar(maxPorArchivo: Int64): ArrayList<ArrayList<LogEntry>> {
        if (maxPorArchivo <= 0) {
            throw IllegalArgumentException("maxPorArchivo debe ser mayor que 0")
        }
        let archivos = ArrayList<ArrayList<LogEntry>>()
        var actual = ArrayList<LogEntry>()
        for (e in entradas) {
            actual.add(e)
            if (actual.size == maxPorArchivo) {
                archivos.add(actual)
                actual = ArrayList<LogEntry>()
            }
        }
        if (actual.size > 0) {
            archivos.add(actual)
        }
        return archivos
    }

    public func resumen(): String {
        var s = "=== Resumen de logs ===\n"
        s += "Entradas válidas: ${total()}\n"
        s += "Líneas inválidas: ${invalidas()}\n"
        for (nivel in NIVELES_VALIDOS) {
            s += "  ${nivel}: ${contarPorNivel(nivel)}\n"
        }
        return s
    }
}
