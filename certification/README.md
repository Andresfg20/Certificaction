# Certificación Corte 3 · Cangjie Programming (Huawei ICT Academy)

[![Certificación Cangjie CI](https://github.com/Andresfg20/Certificaction/actions/workflows/certification-ci.yml/badge.svg)](https://github.com/Andresfg20/Certificaction/actions/workflows/certification-ci.yml)

## Ficha

| Dato | Detalle |
|---|---|
| Nombre completo | Andres Felipe Gomez Anacona |
| Usuario de GitHub | [Andresfg20](https://github.com/Andresfg20) |
| Nombre del curso | Cangjie Programming |
| Plataforma | Huawei Talent · ICT Academy |
| Enlace | https://e.huawei.com/en/talent/ict-academy/#/ict-courses-detail?courseId=fvXQlvE-whPqVon6TmjmbXFGBmk |
| Duración publicada | 56 horas |
| Fecha de inicio | 10 de noviembre de 2026 |
| Fecha de finalización | 13 de noviembre de 2026 |
| Nota del examen final | 70 puntos - 10/15 |
| Certificado | [certificado.pdf](certificado.pdf) · código `ICT20261114000013` · emitido el 14 de noviembre de 2026 |
| Ficha del curso | [00-ficha-del-curso.png](evidencias/00-ficha-del-curso.png) |

## Desarrollo del curso

| Proyecto | Fecha de término | Lo aprendido | Captura | Código |
|---|---|---|---|---|
| 1. Setting Up The Work Environment | 11 de noviembre de 2026 | Aprendí que el SDK de Cangjie es el paquete con el compilador, las librerías y las herramientas necesarias para programar en el lenguaje, y que hay que configurarlo con las variables de entorno para que el sistema lo reconozca. Entendí la diferencia entre `cjc`, que compila un archivo suelto, y `cjpm`, que crea y gestiona proyectos completos con su archivo `cjpm.toml`. Vi qué hace un IDE (editar, compilar, depurar y organizar todo en un solo lugar) y cómo la relación entre lenguaje y compilador hace que los dos evolucionen juntos. Hice el entorno en macOS, que al ser un sistema Unix funciona casi igual que Linux. | [01-proyecto-1.png](evidencias/01-proyecto-1.png) | [codigo/proyecto-1](codigo/proyecto-1/) |
| 2. Log File Management | 13 de noviembre de 2026 | Aprendí los tipos de datos básicos de Cangjie (enteros, decimales, booleanos y cadenas) y que hay que convertir los tipos explícitamente porque el lenguaje no mezcla tipos distintos en una operación. Practiqué leer datos de la consola y escribir logs en un archivo, usando `try` con recursos para que el archivo se cierre solo y `catch` para manejar errores como una entrada inválida. Usé `if`, `while` y `for-in` para armar menús que se repiten hasta que el usuario elige salir. Vi cómo definir funciones, sobrecargarlas (mismo nombre, distintos parámetros) y pasarles una lambda como último argumento para filtrar los logs por nivel. | [02-proyecto-2.png](evidencias/02-proyecto-2.png) | [codigo/proyecto-2](codigo/proyecto-2/) |
| 3. System Data Analysis | 13 de noviembre de 2026 | Aprendí a usar `enum` para limitar los valores posibles (como los distritos válidos) y `match` para cubrir todos los casos, algo más seguro que un `switch`. Entendí que `Option` (`?Int64`) reemplaza al `null` y obliga a decidir qué hacer cuando no hay valor, con `match`, `if-let` o `??`. Practiqué las colecciones (`Array`, `ArrayList`, `HashSet`, `HashMap`) y las tuplas para administrar una lista de dispositivos sin IDs repetidos. Leí un archivo CSV línea por línea, limpié los pagos fallidos y agrupé las ventas por región, producto y mes. Por último usé funciones de orden superior y el operador `\|>` para encadenar los pasos del análisis. | [03-proyecto-3.png](evidencias/03-proyecto-3.png) | [codigo/proyecto-3](codigo/proyecto-3/) |
| 4. Business Function Optimization | 13 de noviembre de 2026, 8:09 p. m. | Aprendí a modelar entidades con clases: propiedades con validación (`prop`), constructores, miembros estáticos y el patrón singleton para tener un único administrador de dispositivos. Practiqué la herencia (`open`, `override`, `redef`), las clases abstractas y las interfaces, y vi que una clase solo hereda de una pero puede implementar varias interfaces. Con el polimorfismo, una habitación llama a `operate()` o `open()` sin saber de qué tipo es cada dispositivo. Usé genéricos con restricciones (`where T <: Parsable<T>`) para validar entradas, y llamé funciones en C con `foreign` y `unsafe` para limpiar la consola. | [04-proyecto-4.png](evidencias/04-proyecto-4.png) | [codigo/proyecto-4](codigo/proyecto-4/) |
| Examen final | 13 de noviembre de 2026, 8:46 p. m. | Repasé los cuatro proyectos para el examen: tipos de datos y flujo de control, manejo de excepciones, `enum` y `Option` con `match`, colecciones y programación funcional, y orientación a objetos con herencia, interfaces, genéricos y polimorfismo. Con esto reforcé sobre todo las diferencias de Cangjie frente a otros lenguajes, como la conversión explícita de tipos y la ausencia de `null`. | [05-examen-final.png](evidencias/05-examen-final.png) | No aplica (el examen no lleva código) |

## Estructura

```text
certification/
├── README.md
├── certificado.pdf
├── evidencias/
│   ├── 00-ficha-del-curso.png
│   ├── 01-proyecto-1.png
│   ├── 02-proyecto-2.png
│   ├── 03-proyecto-3.png
│   ├── 04-proyecto-4.png
│   └── 05-examen-final.png
└── codigo/
    ├── proyecto-1/   # hola-cjc (cjc), cjpmDemo y cangjie (cjpm)
    ├── proyecto-2/   # tareas 2.1 consola, 2.2 guardar logs, 2.3 filtrar logs
    ├── proyecto-3/   # tareas 3.1 validación, 3.2 dispositivos, 3.3 CSV, 3.4 funcional
    └── proyecto-4/   # tareas 4.1 aire acondicionado, 4.2 dispositivos, 4.3 habitaciones (con FFI a C)
```

## Tecnologías

- **Lenguaje:** Cangjie (Huawei), SDK 1.x
- **Herramientas:** `cjc` (compilador), `cjpm` (gestor de proyectos y pruebas), `std.unittest`
- **Interoperabilidad:** funciones en C (`foreign` / `unsafe`) en el proyecto 4, compiladas con `gcc` o `clang`
- **IDE:** VS Code con la extensión de Cangjie, o DevEco Studio con DevEco-Cangjie-Plugin
- **CI:** GitHub Actions (valida la estructura, compila, ejecuta y prueba cada proyecto)

## Cómo ejecutar

Requisito: Cangjie SDK instalado y `cjc -v` respondiendo en la terminal.

```bash
# Todos los proyectos (Linux, macOS o Git Bash en Windows), desde la raíz del repo
bash scripts/probar-todo.sh

# Un proyecto concreto
cd certification/codigo/proyecto-1/cjpmDemo
cjpm build && cjpm run && cjpm test
```

En Windows con PowerShell: `powershell -ExecutionPolicy Bypass -File scripts/probar-todo.ps1`.

## Relación con la asignatura

En el proyecto de aula usamos Kotlin, y Cangjie se siente bastante familiar. Ambos son de tipado estático con inferencia y separan `let`/`var` como `val`/`var`. En tipos, Cangjie no hace conversiones automáticas entre `Int16` e `Int64`, algo parecido a lo estricto de Kotlin, y `Option` (`?Int64`) cumple el mismo papel que los tipos anulables (`Int?`) al obligar a manejar la ausencia de valor con `match`, `if-let` o `??`. En clases, las ideas son casi las mismas (`open`, `abstract`, interfaces, constructor principal), aunque la sintaxis cambia (`<:` en vez de `:`) y el `match` de Cangjie se parece al `when` de Kotlin. En excepciones, ambos usan `try/catch/finally`, y el `try` con recursos de Cangjie equivale al `use` de Kotlin. Para una app móvil aprovecharía el manejo seguro de valores ausentes, el `match` exhaustivo y la posibilidad de crear aplicaciones nativas de HarmonyOS, además de la interoperabilidad con C para usar librerías del sistema.
