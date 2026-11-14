package task4_3.model

import std.env.*
import std.random.*
import std.convert.*

public enum FanSpeed {
    | LOW
    | MIDDLE
    | HIGH

    public func toString(): String {
        match (this) {
            case LOW => "Low Speed"
            case MIDDLE => "Medium Speed"
            case HIGH => "High Speed"
        }
    }
}

public open class Device {
    public static prop deviceType: String {
        get() { "DEVICE" }
    }

    private var _deviceId: Int64
    public mut prop deviceId: Int64 {
        get() { _deviceId }
        set(id) {
            if (id <= 0) {
                throw Exception("Device ID cannot be negative")
            }
            _deviceId = id
        }
    }

    public var deviceName: String
    public var isOnline: Bool = false

    public init(deviceId: Int64, deviceName: String) {
        this._deviceId = deviceId
        this.deviceName = deviceName
    }

    public func connect(): Unit {
        if (let Some(o) <- (this as Openable)) {
            if (!o.isOpened) {
                return
            }
        }
        isOnline = true
    }

    public func disconnect(): Unit {
        isOnline = false
    }

    // Las subclases los sobrescriben (polimorfismo)
    public open func displayStatus(): Unit {
        println("Status display is not implemented!")
    }

    public open func operate(): Unit {
        println("Operation is not implemented!")
    }
}

public class AirPurifierDevice <: Device & Openable & TemperatureMonitoring & HumidityMonitoring {
    public static prop deviceType: String {
        get() { "AIR_PURIFIER_DEVICE" }
    }

    private var _humidity: Float64 = 0.0
    private var _temperature: Float64 = 0.0
    private var _pm25: Float64 = 0.0
    private var _isOpened: Bool = false

    public prop humidity: Float64 {
        get() { _humidity }
    }

    public prop temperature: Float64 {
        get() { _temperature }
    }

    public prop isOpened: Bool {
        get() { _isOpened }
    }

    public prop pm25: Float64 {
        get() { _pm25 }
    }

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    private func refreshData() {
        _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
        _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        _pm25 = Random().nextGaussianFloat64(mean: 30.0, sigma: 10.0)
    }

    public func open(): Unit {
        _isOpened = true
        refreshData()
    }

    public func close(): Unit {
        _isOpened = false
        isOnline = false
    }

    public func togglePower(): Unit {
        if (_isOpened) {
            close()
        } else {
            open()
        }
    }

    public func update(): Unit {
        if (!_isOpened || !isOnline) {
            return
        }
        refreshData()
    }

    public override func displayStatus(): Unit {
        update()
        let state = if (_isOpened) {
            "On PM2.5: ${pm25.format(".1")}ug/m3 ${temperature.format(".1")}°C ${humidity.format(".0")}%"
        } else {
            "Off"
        }
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        println("Current status: ${state}")
    }

    public override func operate(): Unit {
        while (true) {
            clearConsole()
            displayStatus()
            println("Operations: [1] Connect [2] Power [3] Update [4] Back")
            let order = getStdIn().readln() ?? ""
            match (order) {
                case "1" => if (isOnline) { disconnect() } else { connect() }
                case "2" => togglePower()
                case "3" => update()
                case "4" => break
                case _ => println("Command input error, please re-enter!")
            }
        }
    }
}

public class AirConditionerDevice <: Device & Openable & TemperatureMonitoring & HumidityMonitoring {
    public static prop deviceType: String {
        get() { "AIR_CONDITIONER_DEVICE" }
    }

    private var _humidity: Float64 = 0.0
    private var _temperature: Float64 = 0.0
    private var _isOpened: Bool = false
    private var _targetTemperature: Int64 = 25
    public var fanSpeed: FanSpeed = FanSpeed.MIDDLE

    public prop humidity: Float64 {
        get() { _humidity }
    }

    public prop temperature: Float64 {
        get() { _temperature }
    }

    public prop isOpened: Bool {
        get() { _isOpened }
    }

    public mut prop targetTemperature: Int64 {
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

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    public func update(): Unit {
        if (_isOpened) {
            _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
            _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        }
    }

    public func open(): Unit {
        _isOpened = true
        update()
    }

    public func close(): Unit {
        _isOpened = false
        isOnline = false
        _temperature = 0.0
        _humidity = 0.0
    }

    public func togglePower(): Unit {
        if (_isOpened) {
            close()
        } else {
            open()
        }
    }

    public func toggleFanSpeed(): Unit {
        fanSpeed = match (fanSpeed) {
            case FanSpeed.LOW => FanSpeed.MIDDLE
            case FanSpeed.MIDDLE => FanSpeed.HIGH
            case FanSpeed.HIGH => FanSpeed.LOW
        }
    }

    public override func displayStatus(): Unit {
        update()
        let state = if (_isOpened) {
            "On ${temperature.format(".1")}°C ${humidity.format(".0")}%"
        } else {
            "Off"
        }
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        println("Current status: ${state}")
        println("Preset temperature: ${targetTemperature}°C")
        println("Fan speed mode: ${fanSpeed.toString()}")
    }

    public override func operate(): Unit {
        while (true) {
            clearConsole()
            displayStatus()
            println("Operation: [1] Connect [2] Power [3] Temperature [4] Fan Speed [5] Exit")
            let order = getStdIn().readln() ?? ""
            match (order) {
                case "1" => if (isOnline) { disconnect() } else { connect() }
                case "2" => togglePower()
                case "3" =>
                    // Solo si está encendido y conectado
                    if (_isOpened && isOnline) {
                        print("Please enter temperature (16~28): ")
                        try {
                            targetTemperature = Utils.inputInfo<Int64>(16, 28)
                        } catch (e: Exception) {
                            println("${e}")
                            println("Press Enter to continue.")
                            getStdIn().readln()
                        }
                    }
                case "4" =>
                    if (_isOpened && isOnline) {
                        toggleFanSpeed()
                    }
                case "5" => break
                case _ => println("Command input error, please re-enter!")
            }
        }
    }
}
