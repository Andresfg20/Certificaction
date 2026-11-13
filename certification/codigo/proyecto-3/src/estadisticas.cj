package data_analysis

import std.collection.*
import std.math.*

// Funciones estadísticas puras sobre series de enteros (porcentajes 0-100).
// Todas validan la entrada y lanzan IllegalArgumentException si la serie está vacía.

func validarNoVacio(valores: Array<Int64>): Unit {
    if (valores.size == 0) {
        throw IllegalArgumentException("La serie de datos no puede estar vacía")
    }
}

public func minimo(valores: Array<Int64>): Int64 {
    validarNoVacio(valores)
    var m = valores[0]
    for (v in valores) {
        if (v < m) {
            m = v
        }
    }
    return m
}

public func maximo(valores: Array<Int64>): Int64 {
    validarNoVacio(valores)
    var m = valores[0]
    for (v in valores) {
        if (v > m) {
            m = v
        }
    }
    return m
}

public func promedio(valores: Array<Int64>): Float64 {
    validarNoVacio(valores)
    var suma: Int64 = 0
    for (v in valores) {
        suma += v
    }
    return Float64(suma) / Float64(valores.size)
}

public func desviacionEstandar(valores: Array<Int64>): Float64 {
    let media = promedio(valores)
    var acumulado: Float64 = 0.0
    for (v in valores) {
        let d = Float64(v) - media
        acumulado += d * d
    }
    return sqrt(acumulado / Float64(valores.size))
}

// Ordenamiento por inserción sobre una copia: no modifica la serie original.
public func ordenar(valores: Array<Int64>): Array<Int64> {
    let copia = valores.clone()
    var i: Int64 = 1
    while (i < copia.size) {
        let actual = copia[i]
        var j = i - 1
        while (j >= 0 && copia[j] > actual) {
            copia[j + 1] = copia[j]
            j -= 1
        }
        copia[j + 1] = actual
        i += 1
    }
    return copia
}

public func mediana(valores: Array<Int64>): Float64 {
    validarNoVacio(valores)
    let o = ordenar(valores)
    let n = o.size
    if (n % 2 == 1) {
        return Float64(o[n / 2])
    }
    return Float64(o[n / 2 - 1] + o[n / 2]) / 2.0
}

// Media móvil simple con ventana fija; devuelve n - ventana + 1 valores.
public func mediaMovil(valores: Array<Int64>, ventana: Int64): ArrayList<Float64> {
    if (ventana <= 0 || ventana > valores.size) {
        throw IllegalArgumentException("Ventana inválida: ${ventana}")
    }
    let r = ArrayList<Float64>()
    var suma: Int64 = 0
    var i: Int64 = 0
    while (i < valores.size) {
        suma += valores[i]
        if (i >= ventana) {
            suma -= valores[i - ventana]
        }
        if (i >= ventana - 1) {
            r.add(Float64(suma) / Float64(ventana))
        }
        i += 1
    }
    return r
}

// Índices de las muestras que superan el umbral.
public func anomalias(valores: Array<Int64>, umbral: Int64): ArrayList<Int64> {
    let r = ArrayList<Int64>()
    var i: Int64 = 0
    while (i < valores.size) {
        if (valores[i] > umbral) {
            r.add(i)
        }
        i += 1
    }
    return r
}
