package task4_3.model

import std.convert.*
import std.env.*

foreign func clearScreen(): Unit
foreign func chcp65001(): Unit

public func clearConsole() {
    unsafe { clearScreen() }
}

public func setUtf8() {
    unsafe { chcp65001() }
}

public class Utils {
    // Lee de consola y convierte a T; 3 intentos
    public static func inputInfo<T>(): T where T <: Parsable<T> {
        var retry = 3
        while (retry > 0) {
            let input = getStdIn().readln() ?? ""
            if (let Some(v) <- T.tryParse(input)) {
                return v
            }
            print("Input error, please re-enter: ")
            retry--
        }
        throw Exception("Input error exceeded 3 times, entry cancelled!")
    }

    // Igual, pero además valida que esté entre min y max
    public static func inputInfo<T>(min: T, max: T): T where T <: Parsable<T> & Comparable<T> {
        var retry = 3
        while (retry > 0) {
            let input = getStdIn().readln() ?? ""
            if (let Some(v) <- T.tryParse(input)) {
                if (v >= min && v <= max) {
                    return v
                }
                print("Value out of range, please re-enter: ")
            } else {
                print("Input error, please re-enter: ")
            }
            retry--
        }
        throw Exception("Input error exceeded 3 times, entry cancelled!")
    }
}
