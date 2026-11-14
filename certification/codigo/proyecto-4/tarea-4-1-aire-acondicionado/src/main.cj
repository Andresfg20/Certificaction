package task4_1

import std.collection.*
import std.env.*
import std.convert.*
import std.random.*

// Funciones en C (interoperabilidad)
foreign func clearScreen(): Unit
foreign func chcp65001(): Unit

enum FanSpeed {
    | LOW
    | MIDDLE
    | HIGH

    func toString(): String {
        match (this) {
            case LOW => "Low Speed"
            case MIDDLE => "Medium Speed"
            case HIGH => "High Speed"
        }
    }
}

class AirConditionerDevice {
    static prop deviceType: String {
        get() { "AIR_CONDITIONER_DEVICE" }
    }

    private var _deviceId: Int64
    mut prop deviceId: Int64 {
        get() { _deviceId }
        set(id) {
            if (id <= 0) {
                throw Exception("Device ID must be positive.")
            }
            _deviceId = id
        }
    }

    var deviceName: String
    var isOnline: Bool = false
    var isOpened: Bool = false
    var temperature: Float64 = 0.0
    var humidity: Float64 = 0.0
    var fanSpeed: FanSpeed = FanSpeed.MIDDLE

    private var _targetTemperature: Int64 = 25
    mut prop targetTemperature: Int64 {
        get() { _targetTemperature }
        set(value) {
            if (value < 16) {
                throw Exception("Temperature cannot be lower than 16°C.")
            }
            if (value > 28) {
                throw Exception("Temperature cannot be higher than 28°C.")
            }
            _targetTemperature = value
        }
    }

    init(deviceId: Int64, deviceName: String) {
        if (deviceId <= 0) {
            throw Exception("Device ID must be positive.")
        }
        this._deviceId = deviceId
        this.deviceName = deviceName
    }

    // Un equipo apagado no se puede conectar
    func connect() {
        if (!isOpened) {
            return
        }
        isOnline = true
    }

    func disconnect() {
        isOnline = false
    }

    func update() {
        if (isOpened) {
            temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
            humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        }
    }

    func open() {
        isOpened = true
        update()
    }

    // Al apagar: se desconecta y se reinician los datos
    func close() {
        isOpened = false
        isOnline = false
        temperature = 0.0
        humidity = 0.0
    }

    func togglePower() {
        if (isOpened) {
            close()
        } else {
            open()
        }
    }

    func toggleFanSpeed() {
        fanSpeed = match (fanSpeed) {
            case FanSpeed.LOW => FanSpeed.MIDDLE
            case FanSpeed.MIDDLE => FanSpeed.HIGH
            case FanSpeed.HIGH => FanSpeed.LOW
        }
    }

    func displayStatus() {
        update()
        let state = if (isOpened) {
            "On ${temperature.format(".1")}°C ${humidity.format(".0")}%"
        } else {
            "Off"
        }
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        println("Current status: ${state}")
        println("Target temperature: ${targetTemperature}°C")
        println("Fan speed mode: ${fanSpeed.toString()}")
    }

    func askTemperature() {
        print("Please enter temperature (16~28): ")
        let text = getStdIn().readln() ?? ""
        try {
            this.targetTemperature = Int64.parse(text)
        } catch (e: Exception) {
            // Falla si no es número o si está fuera de rango
            println("${e}")
            println("Press Enter to continue")
            // Se descarta el valor leído: el catch debe ser Unit como el bloque try
            let _ = getStdIn().readln()
        }
    }

    func operateByConsole() {
        while (true) {
            unsafe { clearScreen() }
            displayStatus()
            if (isOpened && isOnline) {
                println("Operation: [1] Connect [2] Power [3] Temperature [4] Fan Speed [5] Exit")
                let order = getStdIn().readln() ?? ""
                match (order) {
                    case "1" => if (isOnline) { disconnect() } else { connect() }
                    case "2" => togglePower()
                    case "3" => askTemperature()
                    case "4" => toggleFanSpeed()
                    case "5" => break
                    case _ => println("Command input error, please re-enter!")
                }
            } else {
                println("Operation: [1] Connect [2] Power [3] Exit")
                let order = getStdIn().readln() ?? ""
                match (order) {
                    case "1" => if (isOnline) { disconnect() } else { connect() }
                    case "2" => togglePower()
                    case "3" => break
                    case _ => println("Command input error, please re-enter!")
                }
            }
        }
    }
}

// Singleton: una sola instancia que guarda la lista de equipos
class AirConditionerManager {
    public let airconditioners = ArrayList<AirConditionerDevice>()

    private init() {
        let living = AirConditionerDevice(10001, "Living Room Air Conditioner")
        living.open()
        living.connect()
        airconditioners.add(living)

        let bedroom = AirConditionerDevice(10002, "Bedroom Air Conditioner")
        bedroom.open()
        bedroom.connect()
        airconditioners.add(bedroom)
    }

    private static let manager = AirConditionerManager()

    public static func getInstance(): AirConditionerManager {
        manager
    }

    public func addAirConditioner(device: AirConditionerDevice) {
        this.airconditioners.add(device)
    }

    public func removeAirConditioner(index: Int64) {
        this.airconditioners.remove(at: index)
    }
}

func pause() {
    println("Press Enter to continue.")
    getStdIn().readln()
}

func listDevices(manager: AirConditionerManager) {
    for (i in 0..manager.airconditioners.size) {
        let ac = manager.airconditioners[i]
        println("[${i + 1}] Device: ${ac.deviceName}; ID: ${ac.deviceId}")
    }
}

main(): Int64 {
    let manager = AirConditionerManager.getInstance()
    unsafe { chcp65001() }

    while (true) {
        unsafe { clearScreen() }
        println("===== Smart Air Conditioner Device Management Software =====")
        println("Please enter command: [1] Configure device [2] Add device [3] Delete device [4] Exit software")
        let order = getStdIn().readln() ?? ""
        match (order) {
            case "1" =>
                listDevices(manager)
                print("Please enter the number: ")
                let text = getStdIn().readln() ?? ""
                if (let Some(n) <- Int64.tryParse(text)) {
                    if (n >= 1 && n <= manager.airconditioners.size) {
                        manager.airconditioners[n - 1].operateByConsole()
                    } else {
                        println("Incorrect number, please try again!")
                        pause()
                    }
                } else {
                    println("Incorrect number, please try again!")
                    pause()
                }
            case "2" =>
                print("Please enter the device ID: ")
                let idText = getStdIn().readln() ?? ""
                try {
                    let id = Int64.parse(idText)
                    print("Please enter the device name: ")
                    let name = getStdIn().readln() ?? ""
                    manager.addAirConditioner(AirConditionerDevice(id, name))
                    println("Device added successfully!")
                } catch (e: Exception) {
                    println("${e}")
                }
                pause()
            case "3" =>
                listDevices(manager)
                print("Please enter the number: ")
                let text = getStdIn().readln() ?? ""
                if (let Some(n) <- Int64.tryParse(text)) {
                    if (n >= 1 && n <= manager.airconditioners.size) {
                        manager.removeAirConditioner(n - 1)
                        println("Device deleted successfully!")
                    } else {
                        println("Number error!")
                    }
                } else {
                    println("Number error!")
                }
                pause()
            case "4" => break
            case _ => continue
        }
    }
    return 0
}
