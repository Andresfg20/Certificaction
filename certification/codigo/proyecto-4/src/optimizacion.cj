package business_opt

import std.collection.*

// Comparación de versiones ingenua vs optimizada. Cada función devuelve
// (resultado, operaciones) para medir el costo de forma determinista,
// sin depender de la velocidad de la máquina.

// O(n^2): compara cada par de IDs.
public func duplicadosIngenuo(ids: Array<Int64>): (Int64, Int64) {
    var duplicados: Int64 = 0
    var operaciones: Int64 = 0
    var i: Int64 = 0
    while (i < ids.size) {
        var j: Int64 = 0
        var repetido = false
        while (j < i) {
            operaciones += 1
            if (ids[j] == ids[i]) {
                repetido = true
                break
            }
            j += 1
        }
        if (repetido) {
            duplicados += 1
        }
        i += 1
    }
    return (duplicados, operaciones)
}

// O(n): un HashSet recuerda los IDs ya vistos.
public func duplicadosOptimizado(ids: Array<Int64>): (Int64, Int64) {
    let vistos = HashSet<Int64>()
    var duplicados: Int64 = 0
    var operaciones: Int64 = 0
    for (id in ids) {
        operaciones += 1
        if (vistos.contains(id)) {
            duplicados += 1
            continue
        }
        vistos.add(id)
    }
    return (duplicados, operaciones)
}

// Catálogo de precios: búsqueda lineal O(n) vs índice HashMap O(1).
public class Catalogo {
    private let nombres = ArrayList<String>()
    private let precios = ArrayList<Int64>()
    private let indice = HashMap<String, Int64>()

    public func registrar(nombre: String, precio: Int64): Unit {
        nombres.add(nombre)
        precios.add(precio)
        indice[nombre] = precio
    }

    public func precioLineal(nombre: String): (Option<Int64>, Int64) {
        var operaciones: Int64 = 0
        var i: Int64 = 0
        while (i < nombres.size) {
            operaciones += 1
            if (nombres[i] == nombre) {
                return (Some(precios[i]), operaciones)
            }
            i += 1
        }
        return (None, operaciones)
    }

    public func precioIndexado(nombre: String): (Option<Int64>, Int64) {
        if (indice.contains(nombre)) {
            return (Some(indice[nombre]), 1)
        }
        return (None, 1)
    }
}

// Proyección de ventas acumuladas tipo Fibonacci: recursiva vs memoizada.
public func proyeccionRecursiva(n: Int64): Int64 {
    if (n <= 1) {
        return n
    }
    return proyeccionRecursiva(n - 1) + proyeccionRecursiva(n - 2)
}

public func proyeccionMemoizada(n: Int64): Int64 {
    if (n <= 1) {
        return n
    }
    var anterior: Int64 = 0
    var actual: Int64 = 1
    var i: Int64 = 2
    while (i <= n) {
        let siguiente = anterior + actual
        anterior = actual
        actual = siguiente
        i += 1
    }
    return actual
}
