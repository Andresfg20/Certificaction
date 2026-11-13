package log_manager

import std.unittest.*
import std.unittest.testmacro.*

let DATOS_PRUEBA: String = """
2026-11-12 08:00:01 [INFO] server: Inicio
2026-11-12 08:00:02 [ERROR] auth: Fallo de login
2026-11-12 08:00:03 [ERROR] db: Conexión perdida
2026-11-12 08:00:04 [WARN] db: Consulta lenta
basura
2026-11-12 08:00:05 [FATAL] x: nivel no soportado
"""

@Test
class ParserTest {
    @TestCase
    func parseaLineaValida(): Unit {
        match (parsearLinea("2026-11-12 08:00:01 [INFO] server: Servicio iniciado")) {
            case Some(e) =>
                @Expect(e.fecha, "2026-11-12")
                @Expect(e.hora, "08:00:01")
                @Expect(e.nivel, "INFO")
                @Expect(e.modulo, "server")
                @Expect(e.mensaje, "Servicio iniciado")
            case None => @Expect(false, true)
        }
    }

    @TestCase
    func toleraRetornoDeCarroDeWindows(): Unit {
        @Expect(parsearLinea("2026-11-12 08:00:01 [WARN] db: lento\r").isSome(), true)
    }

    @TestCase
    func rechazaLineasInvalidas(): Unit {
        @Expect(parsearLinea("").isNone(), true)
        @Expect(parsearLinea("sin corchetes").isNone(), true)
        @Expect(parsearLinea("2026-11-12 08:00:01 [TRACE] a: b").isNone(), true)
        @Expect(parsearLinea("2026-11-12 08:00:01 [INFO] sin dos puntos").isNone(), true)
    }
}

@Test
class GestorLogsTest {
    @TestCase
    func cuentaValidasEInvalidas(): Unit {
        let g = GestorLogs()
        g.cargar(DATOS_PRUEBA)
        @Expect(g.total(), 4)
        @Expect(g.invalidas(), 2)
    }

    @TestCase
    func cuentaYFiltraPorNivel(): Unit {
        let g = GestorLogs()
        g.cargar(DATOS_PRUEBA)
        @Expect(g.contarPorNivel("ERROR"), 2)
        @Expect(g.contarPorNivel("DEBUG"), 0)
        @Expect(g.filtrarPorNivel("WARN").size, 1)
    }

    @TestCase
    func filtraPorModuloYBusca(): Unit {
        let g = GestorLogs()
        g.cargar(DATOS_PRUEBA)
        @Expect(g.filtrarPorModulo("db").size, 2)
        @Expect(g.buscar("login").size, 1)
    }

    @TestCase
    func rotaEnBloques(): Unit {
        let g = GestorLogs()
        g.cargar(DATOS_PRUEBA)
        let archivos = g.rotar(3)
        @Expect(archivos.size, 2)
        @Expect(archivos[0].size, 3)
        @Expect(archivos[1].size, 1)
    }
}
