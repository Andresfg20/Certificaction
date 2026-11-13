# Certificación · Programación Móvil (Corte 3)

[![Certificación Cangjie CI](https://github.com/Andresfg20/Certificaction/actions/workflows/certification-ci.yml/badge.svg)](https://github.com/Andresfg20/Certificaction/actions/workflows/certification-ci.yml)

Repositorio de evidencias de la certificación **Cangjie Programming** (Huawei ICT Academy) de **Andres Felipe Gomez Anacona**.

👉 Toda la entrega está en [`certification/`](certification/README.md).

| Carpeta | Contenido |
|---|---|
| [`certification/`](certification/) | README con ficha y avance, certificado, evidencias y código de los 4 proyectos |
| [`scripts/`](scripts/) | Validar estructura y compilar/probar todos los proyectos |
| [`.github/workflows/`](.github/workflows/) | CI: valida estructura, compila, ejecuta y prueba con Cangjie SDK 1.2.1 |
| [`tools/docker/`](tools/docker/) | Entorno Linux opcional |
| [`GUIA-COMPLETA.md`](GUIA-COMPLETA.md) | Guía de entorno, comandos y solución de problemas |

```bash
bash scripts/validar-certificacion.sh   # estructura
bash scripts/probar-todo.sh             # build + run + test (requiere Cangjie SDK)
```
