package task4_3

import std.env.*
import std.convert.*   // necesario para Float64.format()
import task4_3.model.*

func manageDevice(room: Room) {
    while (true) {
        clearConsole()
        println("===== Smart Home Device Management Software =====")
        println("=== Room: ${room.roomId} ${room.roomName} ===")
        println("Devices: ${room.devicesCount}")
        println("Temperature: ${(room.temperature ?? 0.0).format(".1")}°C, Humidity: ${(room.humidity ?? 0.0).format(".1")}%")
        for (device in room.devices) {
            println("${device.deviceId} ${device.deviceName} Connection Status: ${device.isOnline}")
        }
        var menu = "Select device: "
        for (i in 0..room.devices.size) {
            menu += "[${i + 1}] ${room.devices[i].deviceName} "
        }
        menu += "[${room.devices.size + 1}] Open and connect all devices "
        menu += "[${room.devices.size + 2}] Close all devices "
        menu += "[${room.devices.size + 3}] Return"
        println(menu)

        let order = getStdIn().readln() ?? ""
        if (order == (room.devices.size + 1).toString()) {
            room.openAllDevices()
            room.connectAllDevices()
        } else if (order == (room.devices.size + 2).toString()) {
            room.closeAllDevices()
        } else if (order == (room.devices.size + 3).toString()) {
            break
        } else {
            var found = false
            for (i in 0..room.devices.size) {
                if (order == (i + 1).toString()) {
                    // Polimorfismo: cada tipo de dispositivo tiene su propio panel
                    room.devices[i].operate()
                    found = true
                }
            }
            if (!found) {
                println("Command input error, please try again!")
                println("Press Enter to continue.")
                getStdIn().readln()
            }
        }
    }
}

main(): Int64 {
    let roomManager = RoomManager.getInstance()
    for (room in roomManager.rooms) {
        room.openAllDevices()
        room.connectAllDevices()
    }
    setUtf8()

    while (true) {
        clearConsole()
        println("===== Smart Home Device Management Software =====")
        for (room in roomManager.rooms) {
            println("=== Room: ${room.roomId} ${room.roomName} ===")
            println("Devices: ${room.devicesCount}")
            println("Temperature: ${(room.temperature ?? 0.0).format(".1")}°C, Humidity: ${(room.humidity ?? 0.0).format(".1")}%")
        }
        var menu = "Select room: "
        for (i in 0..roomManager.rooms.size) {
            menu += "[${i + 1}] ${roomManager.rooms[i].roomName} "
        }
        menu += "[${roomManager.rooms.size + 1}] Exit"
        println(menu)

        let order = getStdIn().readln() ?? ""
        if (order == (roomManager.rooms.size + 1).toString()) {
            break
        }
        var found = false
        for (i in 0..roomManager.rooms.size) {
            if (order == (i + 1).toString()) {
                manageDevice(roomManager.rooms[i])
                found = true
            }
        }
        if (!found) {
            println("Incorrect command input, please try again!")
            println("Press Enter to continue.")
            getStdIn().readln()
        }
    }
    return 0
}
