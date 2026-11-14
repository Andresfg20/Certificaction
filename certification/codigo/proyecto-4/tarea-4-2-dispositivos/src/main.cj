package task4_2

import std.env.*
import std.convert.*   // necesario para Float64.format()
import task4_2.model.*

let sensor = SensorDevice(1001, "My Temperature and Humidity Sensor")
let airPurifier = AirPurifierDevice(1002, "My Air Purifier")
let bodyFatScale = BodyFatScaleDevice(1003, "My Body Fat Scale")

func operateSensor() {
    while (true) {
        clearConsole()
        sensor.displayStatus()
        println("Operation: [1] Connect [2] Update [3] Return")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => if (sensor.isOnline) { sensor.disconnect() } else { sensor.connect() }
            case "2" => sensor.update()
            case "3" => break
            case _ => println("Invalid command input, please try again!")
        }
    }
}

func operateAirPurifier() {
    while (true) {
        clearConsole()
        airPurifier.displayStatus()
        println("Operation: [1] Connect [2] Power [3] Update [4] Return")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => if (airPurifier.isOnline) { airPurifier.disconnect() } else { airPurifier.connect() }
            case "2" => airPurifier.togglePower()
            case "3" => airPurifier.update()
            case "4" => break
            case _ => println("Invalid command input, please try again!")
        }
    }
}

func operateBodyFatScale() {
    while (true) {
        clearConsole()
        bodyFatScale.displayStatus()
        println("Operation: [1] Connect [2] Measure [3] Return")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => if (bodyFatScale.isOnline) { bodyFatScale.disconnect() } else { bodyFatScale.connect() }
            case "2" =>
                let result = bodyFatScale.measure()
                let weight = result[0] ?? 0.0
                let bmi = result[1] ?? 0.0
                println("Measurement result: Weight: ${weight.format(".1")}kg, BMI: ${bmi.format(".1")}kg/m2")
                println("Press Enter to continue.")
                getStdIn().readln()
            case "3" => break
            case _ => println("Invalid command input, please try again!")
        }
    }
}

main(): Int64 {
    setUtf8()
    // Encender y conectar todo al iniciar
    sensor.connect()
    airPurifier.open()
    airPurifier.connect()
    bodyFatScale.connect()

    while (true) {
        clearConsole()
        println("===== Smart Device Management Software =====")
        sensor.displayStatus()
        airPurifier.displayStatus()
        bodyFatScale.displayStatus()
        println("Select device: [1] Temperature and Humidity Sensor [2] Air Purifier [3] Body Fat Scale [4] Exit Software")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" => operateSensor()
            case "2" => operateAirPurifier()
            case "3" => operateBodyFatScale()
            case "4" => break
            case _ => println("Command input error, please try again!")
        }
    }
    return 0
}
