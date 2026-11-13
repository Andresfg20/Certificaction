package log_manager

// Proyecto 2 · Log File Management
// Los datos de ejemplo están embebidos para que el programa sea reproducible
// en cualquier sistema operativo sin depender de rutas de archivos.

let LOG_DE_EJEMPLO: String = """
2026-11-12 08:00:01 [INFO] server: Servicio iniciado en el puerto 8080
2026-11-12 08:00:05 [DEBUG] db: Pool de conexiones creado con 10 conexiones
2026-11-12 08:01:12 [INFO] auth: Usuario andres inició sesión
2026-11-12 08:02:40 [WARN] db: Consulta lenta de 1200 ms en pedidos
2026-11-12 08:03:15 [ERROR] auth: Contraseña inválida para usuario invitado
linea corrupta sin formato
2026-11-12 08:04:00 [ERROR] server: Tiempo de espera agotado en /api/pedidos
2026-11-12 08:05:30 [INFO] server: Petición GET /api/productos atendida en 35 ms
2026-11-12 08:06:45 [WARN] server: Uso de memoria al 85 por ciento
"""

main(): Int64 {
    let gestor = GestorLogs()
    gestor.cargar(LOG_DE_EJEMPLO)
    print(gestor.resumen())

    println("\n=== Solo errores ===")
    for (e in gestor.filtrarPorNivel("ERROR")) {
        println(e.toString())
    }

    println("\n=== Módulo db ===")
    for (e in gestor.filtrarPorModulo("db")) {
        println(e.toString())
    }

    println("\n=== Búsqueda: mensajes que contienen 'ms' ===")
    for (e in gestor.buscar("ms")) {
        println(e.toString())
    }

    println("\n=== Rotación (máx. 3 líneas por archivo) ===")
    var i: Int64 = 1
    for (archivo in gestor.rotar(3)) {
        println("app.log.${i}: ${archivo.size} líneas")
        i += 1
    }
    return 0
}
