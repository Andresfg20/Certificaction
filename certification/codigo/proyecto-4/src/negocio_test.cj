package business_opt

import std.unittest.*
import std.unittest.testmacro.*

@Test
class DescuentosTest {
    @TestCase
    func politicasBasicas(): Unit {
        @Expect(SinDescuento().aplicar(1000), 1000)
        @Expect(DescuentoPorcentaje(20).aplicar(1000), 800)
        @Expect(DescuentoPorVolumen(500).aplicar(1000), 900)
        @Expect(DescuentoPorVolumen(5000).aplicar(1000), 1000)
    }

    @TestCase
    func porcentajeInvalidoLanzaExcepcion(): Unit {
        @ExpectThrows[IllegalArgumentException](DescuentoPorcentaje(150))
    }

    @TestCase
    func totalYMejorPolitica(): Unit {
        let p = Pedido(1, "Cliente")
        p.agregar(LineaPedido("A", 1000, 3)).agregar(LineaPedido("B", 500, 2))
        @Expect(p.subtotal(), 4000)
        @Expect(p.total(DescuentoPorcentaje(25)), 3000)
        let politicas: Array<PoliticaDescuento> = [SinDescuento(), DescuentoPorcentaje(5), DescuentoPorVolumen(1000)]
        @Expect(mejorPolitica(p, politicas).nombre(), "10 % por compras desde 1000")
    }

    @TestCase
    func lineaInvalidaLanzaExcepcion(): Unit {
        @ExpectThrows[IllegalArgumentException](LineaPedido("X", 100, 0))
    }
}

@Test
class OptimizacionTest {
    @TestCase
    func ambasVersionesDanElMismoResultado(): Unit {
        let ids: Array<Int64> = [1, 2, 3, 2, 1, 4, 1]
        let (d1, op1) = duplicadosIngenuo(ids)
        let (d2, op2) = duplicadosOptimizado(ids)
        @Expect(d1, 3)
        @Expect(d2, 3)
        @Expect(op2, 7)
        @Expect(op1 > op2, true)
    }

    @TestCase
    func catalogoIndexadoEsConstante(): Unit {
        let c = Catalogo()
        c.registrar("A", 10)
        c.registrar("B", 20)
        c.registrar("C", 30)
        let (precio, opLineal) = c.precioLineal("C")
        let (precio2, opIndice) = c.precioIndexado("C")
        @Expect(precio.getOrThrow(), 30)
        @Expect(precio2.getOrThrow(), 30)
        @Expect(opLineal, 3)
        @Expect(opIndice, 1)
        let (faltante, _) = c.precioIndexado("Z")
        @Expect(faltante.isNone(), true)
    }

    @TestCase
    func proyeccionesCoinciden(): Unit {
        @Expect(proyeccionMemoizada(0), 0)
        @Expect(proyeccionMemoizada(10), 55)
        @Expect(proyeccionRecursiva(20), proyeccionMemoizada(20))
    }
}
