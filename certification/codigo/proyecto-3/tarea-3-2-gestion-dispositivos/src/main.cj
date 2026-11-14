package tarea_3_2_gestion_dispositivos

import std.collection.*
import std.env.*
import std.convert.*

enum District {
    | Dongcheng
    | Xicheng
    | Haidian
    | Chaoyang
    | Fengtai

    func toString(): String {
        match (this) {
            case District.Dongcheng => "Dongcheng District"
            case District.Xicheng => "Xicheng District"
            case District.Haidian => "Haidian District"
            case District.Chaoyang => "Chaoyang District"
            case District.Fengtai => "Fengtai District"
        }
    }
}

func inputDeviceID(): Int64 {
    var id: Int64 = 0
    while (true) {
        print("Ingrese el ID de la máquina (1001~1100): ")
        let input = getStdIn().readln() ?? ""
        try {
            let temp = Int64.parse(input)
            if (temp > 1100 || temp < 1001) {
                throw Exception("ID fuera de rango, intente de nuevo")
            }
            id = temp
            break
        } catch (e: Exception) {
            println("Error: ${e}")
        }
    }
    return id
}

func inputDistrict(): District {
    while (true) {
        print("Ingrese el distrito (Dongcheng, Xicheng, Haidian, Chaoyang, Fengtai): ")
        let input = getStdIn().readln() ?? ""
        match (input) {
            case "Dongcheng" => return District.Dongcheng
            case "Xicheng" => return District.Xicheng
            case "Haidian" => return District.Haidian
            case "Chaoyang" => return District.Chaoyang
            case "Fengtai" => return District.Fengtai
            case _ => println("Distrito inválido, intente de nuevo")
        }
    }
    return District.Dongcheng
}

// Lista de dispositivos (ID, ubicación) y conjunto de IDs para garantizar unicidad
let devices = ArrayList<(Int64, String)>()
let deviceIDs = HashSet<Int64>()

func printDevices() {
    println("Total de dispositivos: ${devices.size}")
    for (device in devices) {
        println("ID: ${device[0]}, Ubicación: ${device[1]}")
    }
}

func addDevice() {
    var id = inputDeviceID()
    while (deviceIDs.contains(id)) {
        println("ID repetido, ingrese otro")
        id = inputDeviceID()
    }
    deviceIDs.add(id)
    let location = inputDistrict().toString()
    devices.add((id, location))
    println("Registro exitoso, ID: ${id}, ${location}")
}

func deleteDevice() {
    let id = inputDeviceID()
    for (i in 0..devices.size) {
        if (devices[i][0] == id) {
            devices.remove(at: i)
            deviceIDs.remove(id)
            println("Dispositivo ${id} eliminado")
            return
        }
    }
    println("El dispositivo ${id} no existe")
}

func updateDevice() {
    let id = inputDeviceID()
    for (i in 0..devices.size) {
        if (devices[i][0] == id) {
            let district = inputDistrict().toString()
            devices[i] = (id, district)
            println("Ubicación actualizada: ${id} -> ${district}")
            return
        }
    }
    println("El dispositivo ${id} no existe")
}

func queryByDistrict() {
    let district = inputDistrict().toString()
    var num: Int64 = 0
    for (device in devices) {
        if (device[1] == district) {
            println("ID: ${device[0]}, Ubicación: ${device[1]}")
            num++
        }
    }
    if (num == 0) {
        println("Aún no hay dispositivos en ${district}")
    } else {
        println("Total en ${district}: ${num}")
    }
}

main(): Int64 {
    println("========== Gestión de máquinas expendedoras ==========")
    while (true) {
        println("Menú: [1] Imprimir [2] Agregar [3] Eliminar [4] Modificar [5] Consultar (zona) [6] Salir")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => printDevices()
            case "2" => addDevice()
            case "3" => deleteDevice()
            case "4" => updateDevice()
            case "5" => queryByDistrict()
            case "6" => break
            case _ => println("Comando inválido, intente de nuevo")
        }
    }
    return 0
}
