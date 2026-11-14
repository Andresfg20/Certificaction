package task4_3.model

import std.collection.*

public enum RoomType {
    | LIVING_ROOM
    | BED_ROOM
}

public class Room {
    public var roomId: Int64
    public var roomName: String
    public var roomType: RoomType
    public let devices: ArrayList<Device> = ArrayList<Device>()

    public prop devicesCount: Int64 {
        get() { devices.size }
    }

    // Temperatura del primer dispositivo conectado que mida temperatura
    public prop temperature: Option<Float64> {
        get() {
            for (device in devices) {
                if (device.isOnline) {
                    if (let Some(t) <- (device as TemperatureMonitoring)) {
                        return Some(t.temperature)
                    }
                }
            }
            return None
        }
    }

    // Humedad del primer dispositivo conectado que mida humedad
    public prop humidity: Option<Float64> {
        get() {
            for (device in devices) {
                if (device.isOnline) {
                    if (let Some(h) <- (device as HumidityMonitoring)) {
                        return Some(h.humidity)
                    }
                }
            }
            return None
        }
    }

    public init(roomId: Int64, roomName: String, roomType: RoomType) {
        this.roomId = roomId
        this.roomName = roomName
        this.roomType = roomType
    }

    public func addDevice(device: Device) {
        devices.add(device)
    }

    public func removeDeviceById(deviceId: Int64) {
        devices.removeIf { d: Device => d.deviceId == deviceId }
    }

    public func openAllDevices() {
        for (device in devices) {
            if (let Some(o) <- (device as Openable)) {
                o.open()
            }
        }
    }

    public func connectAllDevices() {
        for (device in devices) {
            device.connect()
        }
    }

    public func closeAllDevices() {
        for (device in devices) {
            if (let Some(o) <- (device as Openable)) {
                o.close()
            }
        }
    }
}

// Singleton con la lista de habitaciones
public class RoomManager {
    public let rooms: ArrayList<Room>

    private init() {
        rooms = ArrayList<Room>()

        let room1 = Room(2001, "My Bedroom", RoomType.BED_ROOM)
        room1.addDevice(AirPurifierDevice(1001, "Bedroom Air Purifier"))
        room1.addDevice(AirConditionerDevice(1002, "Bedroom Air Conditioner"))
        rooms.add(room1)

        let room2 = Room(2002, "My Living Room", RoomType.LIVING_ROOM)
        room2.addDevice(AirConditionerDevice(2001, "Living Room Air Conditioner"))
        rooms.add(room2)
    }

    private static let instance: RoomManager = RoomManager()

    public static func getInstance(): RoomManager {
        return instance
    }
}
