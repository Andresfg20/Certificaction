package task4_3.model

public interface Openable {
    prop isOpened: Bool
    func open(): Unit
    func close(): Unit
    func togglePower(): Unit
}

public interface TemperatureMonitoring {
    prop temperature: Float64
    func update(): Unit
}

public interface HumidityMonitoring {
    prop humidity: Float64
    func update(): Unit
}
