package cjpmDemo

import std.unittest.*
import std.unittest.testmacro.*

@Test
class SaludoTest {
    @TestCase
    func devuelveElSaludoEsperado(): Unit {
        @Expect(saludo(), "Hello Cangjie")
    }
}
