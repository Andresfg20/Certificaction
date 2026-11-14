# Proyecto 4 · Business Function Optimization

Código desarrollado en las tareas del curso: software de gestión de dispositivos de hogar inteligente, que evoluciona de una sola clase a un modelo orientado a objetos completo. Cada tarea es un proyecto `cjpm` independiente que llama a funciones en C (`ffi/program.c`) para limpiar la consola.

| Tarea | Carpeta | Qué hace | Conceptos |
|---|---|---|---|
| 4.1 Aire acondicionado | `tarea-4-1-aire-acondicionado/` | Gestión de aires acondicionados: encender, conectar, temperatura (16–28 °C), velocidad del ventilador; agregar y eliminar equipos. | `class`, `prop` con validación en `set`, `static prop`, `enum` con `match`, singleton (`private init` + `static let`), `foreign` / `unsafe`. |
| 4.2 Dispositivos | `tarea-4-2-dispositivos/` | Sensor de temperatura y humedad, purificador de aire y báscula de grasa corporal con sus paneles de control. | Herencia (`open`, `override`), interfaces (`Openable`, monitoreo), paquetes (`task4_2.model`). |
| 4.3 Habitaciones | `tarea-4-3-habitaciones/` | Habitaciones con varios dispositivos: encender, conectar o apagar todos, y operar cada uno desde su propio panel. | Polimorfismo (`operate()` según el tipo real), una clase + varias interfaces, genéricos con restricciones (`where T <: Parsable<T> & Comparable<T>`). |

## Compilar y ejecutar

Cada tarea enlaza el objeto C `ffi/program.o` (`compile-option` en `cjpm.toml`). Hay que generarlo antes del primer build:

```bash
cd tarea-4-1-aire-acondicionado
cc -c ffi/program.c -o ffi/program.o   # gcc o clang
cjpm build && cjpm run
```

En Windows se necesita un compilador de C (por ejemplo `clang` de LLVM o `gcc` de MSYS2/MinGW). El SDK de Cangjie para Windows no lo incluye.

Ejecución no interactiva (la usa el CI):

```bash
printf '1\n1\n3\n30\n\n3\n22\n4\n5\n2\n10003\nOffice AC\n\n3\n3\n\n4\n' | cjpm run   # 4.1
printf '1\n2\n3\n2\n2\n4\n3\n2\n\n3\n4\n' | cjpm run                                # 4.2
printf '1\n2\n3\n22\n4\n5\n4\n3\n5\n3\n' | cjpm run                                 # 4.3
```

## Ajustes hechos para el SDK 1.2.1

- Tarea 4.1: faltaba la línea `package task4_1`.
- Tarea 4.1: error `The type of this catch block is 'Option<String>'...` en `askTemperature`. El `catch` terminaba en `getStdIn().readln()` (que devuelve `Option<String>`) y el `try` es `Unit`; se cambió por `let _ = getStdIn().readln()`.
- Tareas 4.2 y 4.3: error `undeclared identifier 'format'` en `main.cj`. `Float64.format()` es una extensión de `std.convert`, y ese archivo no la importaba; se agregó `import std.convert.*`.
- `ffi/program.o` es un archivo generado: lo excluye `.gitignore` y lo compilan el CI y los scripts.
