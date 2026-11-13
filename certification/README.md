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
| Fecha de finalización | *(pendiente)* |
| Nota del examen final | *(pendiente)* |
| Certificado | [certificado.pdf](certificado.pdf) |
| Ficha del curso | [00-ficha-del-curso.png](evidencias/00-ficha-del-curso.png) |

## Desarrollo del curso

| Proyecto | Fecha de término | Lo aprendido | Captura | Código |
|---|---|---|---|---|
| 1. Setting Up The Work Environment | 11 de noviembre de 2026 | Aprendí que el SDK de Cangjie es el paquete con el compilador, las librerías y las herramientas necesarias para programar en el lenguaje, y que hay que configurarlo con las variables de entorno para que el sistema lo reconozca. Entendí la diferencia entre `cjc`, que compila un archivo suelto, y `cjpm`, que crea y gestiona proyectos completos con su archivo `cjpm.toml`. Vi qué hace un IDE (editar, compilar, depurar y organizar todo en un solo lugar) y cómo la relación entre lenguaje y compilador hace que los dos evolucionen juntos. Hice el entorno en macOS, que al ser un sistema Unix funciona casi igual que Linux. | [01-proyecto-1.png](evidencias/01-proyecto-1.png) | [codigo/proyecto-1](codigo/proyecto-1/) |
| 2. Log File Management | 13 de noviembre de 2026 | Aprendí los tipos de datos básicos de Cangjie (enteros, decimales, booleanos y cadenas) y que hay que convertir los tipos explícitamente porque el lenguaje no mezcla tipos distintos en una operación. Practiqué leer datos de la consola y escribir logs en un archivo, usando `try` con recursos para que el archivo se cierre solo y `catch` para manejar errores como una entrada inválida. Usé `if`, `while` y `for-in` para armar menús que se repiten hasta que el usuario elige salir. Vi cómo definir funciones, sobrecargarlas (mismo nombre, distintos parámetros) y pasarles una lambda como último argumento para filtrar los logs por nivel. | [02-proyecto-2.png](evidencias/02-proyecto-2.png) | [codigo/proyecto-2](codigo/proyecto-2/) |
| 3. System Data Analysis | *(pendiente)* | *(pendiente)* | [03-proyecto-3.png](evidencias/03-proyecto-3.png) | [codigo/proyecto-3](codigo/proyecto-3/) |
| 4. Business Function Optimization | *(pendiente)* | *(pendiente)* | [04-proyecto-4.png](evidencias/04-proyecto-4.png) | [codigo/proyecto-4](codigo/proyecto-4/) |
| Examen final | *(pendiente)* | *(pendiente)* | [05-examen-final.png](evidencias/05-examen-final.png) | — |

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
    ├── proyecto-3/   # data_analysis: estadísticas y anomalías de CPU/memoria
    └── proyecto-4/   # business_opt: Strategy, HashSet/HashMap, memoización
```

## Tecnologías

- **Lenguaje:** Cangjie (Huawei), SDK 1.x
- **Herramientas:** `cjc` (compilador), `cjpm` (gestor de proyectos y pruebas), `std.unittest`
- **IDE:** VS Code con la extensión de Cangjie, o DevEco Studio con DevEco-Cangjie-Plugin
- **CI:** GitHub Actions (valida la estructura, compila, ejecuta y prueba cada proyecto)

## Cómo ejecutar

Requisito: Cangjie SDK instalado y `cjc -v` respondiendo en la terminal.

```bash
# Todos los proyectos (Linux, macOS o Git Bash en Windows), desde la raíz del repo
bash scripts/probar-todo.sh

# Un proyecto concreto
cd certification/codigo/proyecto-3
cjpm build && cjpm run && cjpm test
```

En Windows con PowerShell: `powershell -ExecutionPolicy Bypass -File scripts/probar-todo.ps1`.

## Relación con la asignatura

*(Borrador para personalizar)* Cangjie es el lenguaje de Huawei para el desarrollo de aplicaciones nativas
de HarmonyOS, un sistema operativo móvil. El curso conecta con Programación Móvil en tres frentes:
la preparación del entorno (SDK, IDE, emulador de dispositivo en DevEco Studio), las prácticas de
ingeniería que toda app móvil necesita (registro y análisis de logs, monitoreo de CPU y memoria,
que en un móvil impactan batería y fluidez) y la optimización de la lógica de negocio, donde
elegir la estructura de datos correcta reduce el trabajo del procesador en dispositivos con recursos limitados.
