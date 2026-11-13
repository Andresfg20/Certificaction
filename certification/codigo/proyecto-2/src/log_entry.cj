package log_manager

// Modelo de una línea de log y su parser.
// Formato esperado:  2026-11-12 08:00:01 [ERROR] auth: Contraseña inválida

let NIVELES_VALIDOS: Array<String> = ["DEBUG", "INFO", "WARN", "ERROR"]

public struct LogEntry <: ToString {
    public let fecha: String
    public let hora: String
    public let nivel: String
    public let modulo: String
    public let mensaje: String

    public init(fecha: String, hora: String, nivel: String, modulo: String, mensaje: String) {
        this.fecha = fecha
        this.hora = hora
        this.nivel = nivel
        this.modulo = modulo
        this.mensaje = mensaje
    }

    public func toString(): String {
        return "${fecha} ${hora} [${nivel}] ${modulo}: ${mensaje}"
    }
}

public func esNivelValido(nivel: String): Bool {
    for (n in NIVELES_VALIDOS) {
        if (n == nivel) {
            return true
        }
    }
    return false
}

// Devuelve None si la línea no cumple el formato (en vez de lanzar excepción),
// así una línea corrupta no detiene el procesamiento del archivo completo.
public func parsearLinea(linea: String): Option<LogEntry> {
    let texto = linea.trimAscii()
    if (texto.isEmpty()) {
        return None
    }
    let posAbre = match (texto.indexOf("[")) {
        case Some(v) => v
        case None => return None
    }
    let posCierra = match (texto.indexOf("]")) {
        case Some(v) => v
        case None => return None
    }
    if (posCierra <= posAbre) {
        return None
    }
    let cabecera = texto[0..posAbre].trimAscii()
    let nivel = texto[(posAbre + 1)..posCierra].trimAscii()
    let resto = texto[(posCierra + 1)..texto.size].trimAscii()

    let partesCabecera = cabecera.split(" ", removeEmpty: true)
    if (partesCabecera.size != 2 || !esNivelValido(nivel)) {
        return None
    }
    let posDosPuntos = match (resto.indexOf(":")) {
        case Some(v) => v
        case None => return None
    }
    let modulo = resto[0..posDosPuntos].trimAscii()
    let mensaje = resto[(posDosPuntos + 1)..resto.size].trimAscii()
    if (modulo.isEmpty()) {
        return None
    }
    return Some(LogEntry(partesCabecera[0], partesCabecera[1], nivel, modulo, mensaje))
}
