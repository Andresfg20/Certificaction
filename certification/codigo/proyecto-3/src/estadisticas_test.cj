package data_analysis

import std.unittest.*
import std.unittest.testmacro.*
import std.math.*

func casiIgual(a: Float64, b: Float64): Bool {
    return abs(a - b) < 0.0001
}

@Test
class EstadisticasTest {
    let serie: Array<Int64> = [10, 40, 20, 30]

    @TestCase
    func minimoYMaximo(): Unit {
        @Expect(minimo(serie), 10)
        @Expect(maximo(serie), 40)
    }

    @TestCase
    func promedioYMediana(): Unit {
        @Expect(casiIgual(promedio(serie), 25.0), true)
        @Expect(casiIgual(mediana(serie), 25.0), true)
        @Expect(casiIgual(mediana([5, 1, 3]), 3.0), true)
    }

    @TestCase
    func desviacion(): Unit {
        // Población: sqrt(((15^2)+(15^2)+(5^2)+(5^2))/4) = sqrt(125)
        @Expect(casiIgual(desviacionEstandar(serie), sqrt(125.0)), true)
    }

    @TestCase
    func ordenarNoModificaOriginal(): Unit {
        let o = ordenar(serie)
        @Expect(o[0], 10)
        @Expect(o[3], 40)
        @Expect(serie[1], 40)
    }

    @TestCase
    func mediaMovilVentana2(): Unit {
        let m = mediaMovil(serie, 2)
        @Expect(m.size, 3)
        @Expect(casiIgual(m[0], 25.0), true)
        @Expect(casiIgual(m[2], 25.0), true)
    }

    @TestCase
    func detectaAnomalias(): Unit {
        let a = anomalias(serie, 25)
        @Expect(a.size, 2)
        @Expect(a[0], 1)
        @Expect(a[1], 3)
    }

    @TestCase
    func serieVaciaLanzaExcepcion(): Unit {
        let vacia: Array<Int64> = []
        @ExpectThrows[IllegalArgumentException](minimo(vacia))
        @ExpectThrows[IllegalArgumentException](mediaMovil(serie, 0))
    }
}

@Test
class CsvTest {
    @TestCase
    func descartaFilasInvalidas(): Unit {
        let m = parsearCsv("hora,cpu,memoria\n08:00,10,20\n08:05,x,20\n08:10,150,20\n08:15,30\n08:20,40,50\r\n")
        @Expect(m.size, 2)
        @Expect(m[1].hora, "08:20")
        @Expect(columnaCpu(m)[1], 40)
        @Expect(columnaMemoria(m)[0], 20)
    }
}
