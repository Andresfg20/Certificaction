# Proyecto 1 · Setting Up The Work Environment

Configuración del entorno de desarrollo de Cangjie (SDK, `cjc`, `cjpm`, VS Code / DevEco Studio).

| Carpeta | Herramienta | Qué demuestra |
|---|---|---|
| `hola-cjc/` | `cjc` | Compilar un archivo suelto sin proyecto. |
| `cjpmDemo/` | `cjpm` | Proyecto creado con `cjpm init`, con prueba unitaria (`cjpm test`). |
| `cangjie/` | `cjpm` | Programa que resume el rol del IDE y la relación lenguaje–compilador. |

## Ejecutar

```bash
# 1) Archivo suelto con cjc
cd hola-cjc
cjc main.cj -o hola        # en Windows: cjc main.cj -o hola.exe
./hola                     # en Windows: .\hola.exe

# 2) Proyecto con cjpm
cd ../cjpmDemo
cjpm build
cjpm run
cjpm test

# 3) Resumen IDE / compilador
cd ../cangjie
cjpm run
```

Salida esperada de `hola-cjc` y `cjpmDemo`: `Hello Cangjie`.
