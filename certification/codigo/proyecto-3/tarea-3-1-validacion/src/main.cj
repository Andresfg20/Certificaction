package tarea_3_1_validacion

import std.env.*
import std.convert.*

// Enum con los únicos distritos permitidos
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

// Pide el ID hasta que sea un entero entre 1001 y 1100
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

// Pide el distrito hasta que coincida con uno de los permitidos
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

main(): Int64 {
    println("========== Registro de máquina expendedora ==========")
    let id = inputDeviceID()
    let district = inputDistrict()
    println("ID: ${id}, Ubicación: ${district.toString()}")
    return 0
}
