package task4_2.model

foreign func clearScreen(): Unit
foreign func chcp65001(): Unit

// Envoltorio público para que main limpie la pantalla sin declarar el foreign
public func clearConsole() {
    unsafe { clearScreen() }
}

public func setUtf8() {
    unsafe { chcp65001() }
}
