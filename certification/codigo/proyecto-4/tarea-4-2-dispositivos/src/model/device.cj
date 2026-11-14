package task4_2.model

import std.random.*
import std.convert.*

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

    // Si el dispositivo es Openable y está apagado, no se conecta
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
}

// Dispositivo con batería: cada subclase muestra la batería a su manera
public abstract class ChargeableDevice <: Device {
    public static prop deviceType: String {
        get() { "CHARGEABLE_DEVICE" }
    }

    public var batteryPercentage: UInt8 = 100

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    public init(deviceId: Int64, deviceName: String, batteryPercentage: UInt8) {
        super(deviceId, deviceName)
        this.batteryPercentage = batteryPercentage
    }

    public func showBatteryInformation(): Unit
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

    // Solo actualiza si está encendido y conectado
    public func update(): Unit {
        if (!_isOpened || !isOnline) {
            return
        }
        refreshData()
    }

    public func displayStatus(): Unit {
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
}

public class SensorDevice <: ChargeableDevice & TemperatureMonitoring & HumidityMonitoring {
    public static prop deviceType: String {
        get() { "SENSOR_DEVICE" }
    }

    private var _humidity: Float64 = 0.0
    private var _temperature: Float64 = 0.0

    public prop humidity: Float64 {
        get() { _humidity }
    }

    public prop temperature: Float64 {
        get() { _temperature }
    }

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
        _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
        _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
    }

    // Al actualizar, la batería baja un poco (simulación)
    public func update(): Unit {
        if (!isOnline) {
            return
        }
        _temperature = Random().nextGaussianFloat64(mean: 28.0, sigma: 1.0)
        _humidity = Random().nextGaussianFloat64(mean: 50.0, sigma: 15.0)
        if (batteryPercentage > 0) {
            batteryPercentage--
        }
    }

    public func showBatteryInformation(): Unit {
        println("Current battery level: ${batteryPercentage}%")
    }

    public func displayStatus(): Unit {
        update()
        println("---------- ${deviceId} ${deviceName} ----------")
        println("Connection status: ${isOnline}")
        showBatteryInformation()
        println("Current status: ${temperature.format(".1")}°C ${humidity.format(".0")}%")
    }
}

public class BodyFatScaleDevice <: ChargeableDevice {
    public static prop deviceType: String {
        get() { "BODY_FAT_SCALE_DEVICE" }
    }

    public init(deviceId: Int64, deviceName: String) {
        super(deviceId, deviceName)
    }

    // Devuelve (peso, IMC); None si el dispositivo está desconectado
    public func measure(): (Option<Float64>, Option<Float64>) {
        if (!isOnline) {
            return (None, None)
        }
        let weight = Random().nextGaussianFloat64(mean: 60.0, sigma: 15.0)
        let bmi = Random().nextGaussianFloat64(mean: 20.0, sigma: 2.0)
        if (batteryPercentage > 0) {
            batteryPercentage--
        }
        return (Some(weight), Some(bmi))
    }

    public func showBatteryInformation(): Unit {
        if (batteryPercentage > 20) {
            println("Battery is sufficient.")
        } else {
            println("Low battery, please recharge in time.")
        }
    }

    public func displayStatus(): Unit {
        println("---------- ${deviceId} ${deviceName} ----------")
        showBatteryInformation()
        println("Connection status: ${isOnline}")
    }
}
