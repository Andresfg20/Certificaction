package data_analysis

import std.collection.*
import std.convert.*

// Una muestra de monitoreo del sistema tomada en una hora concreta.
public struct Muestra {
    public let hora: String
    public let cpu: Int64
    public let memoria: Int64

    public init(hora: String, cpu: Int64, memoria: Int64) {
        this.hora = hora
        this.cpu = cpu
        this.memoria = memoria
    }
}

func aEntero(texto: String): Option<Int64> {
    return Int64.tryParse(texto.trimAscii())
}

// Interpreta CSV "hora,cpu,memoria". Ignora la cabecera, líneas vacías y
// filas con valores no numéricos o fuera del rango 0-100.
public func parsearCsv(texto: String): ArrayList<Muestra> {
    let r = ArrayList<Muestra>()
    for (linea in texto.split("\n")) {
        let l = linea.trimAscii()
        if (l.isEmpty() || l.startsWith("hora")) {
            continue
        }
        let c = l.split(",")
        if (c.size != 3) {
            continue
        }
        match ((aEntero(c[1]), aEntero(c[2]))) {
            case (Some(cpu), Some(mem)) =>
                if (cpu >= 0 && cpu <= 100 && mem >= 0 && mem <= 100) {
                    r.add(Muestra(c[0].trimAscii(), cpu, mem))
                }
            case _ => ()
        }
    }
    return r
}

public func columnaCpu(muestras: ArrayList<Muestra>): Array<Int64> {
    let r = ArrayList<Int64>()
    for (m in muestras) {
        r.add(m.cpu)
    }
    return r.toArray()
}

public func columnaMemoria(muestras: ArrayList<Muestra>): Array<Int64> {
    let r = ArrayList<Int64>()
    for (m in muestras) {
        r.add(m.memoria)
    }
    return r.toArray()
}
