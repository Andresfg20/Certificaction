package business_opt

// Patrón Strategy: cada política de descuento es intercambiable.
// Antes de optimizar, la lógica estaba en un único if/else gigante;
// con interfaces se puede agregar una política nueva sin tocar las existentes.
// Montos en pesos (Int64) para evitar errores de redondeo de Float64.

public interface PoliticaDescuento {
    func nombre(): String
    func aplicar(subtotal: Int64): Int64
}

public class SinDescuento <: PoliticaDescuento {
    public func nombre(): String {
        return "Sin descuento"
    }

    public func aplicar(subtotal: Int64): Int64 {
        return subtotal
    }
}

public class DescuentoPorcentaje <: PoliticaDescuento {
    private let porcentaje: Int64

    public init(porcentaje: Int64) {
        if (porcentaje < 0 || porcentaje > 100) {
            throw IllegalArgumentException("Porcentaje fuera de rango: ${porcentaje}")
        }
        this.porcentaje = porcentaje
    }

    public func nombre(): String {
        return "${porcentaje} % de descuento"
    }

    public func aplicar(subtotal: Int64): Int64 {
        return subtotal - subtotal * porcentaje / 100
    }
}

// 10 % solo si el subtotal alcanza el mínimo.
public class DescuentoPorVolumen <: PoliticaDescuento {
    private let minimo: Int64

    public init(minimo: Int64) {
        this.minimo = minimo
    }

    public func nombre(): String {
        return "10 % por compras desde ${minimo}"
    }

    public func aplicar(subtotal: Int64): Int64 {
        if (subtotal >= minimo) {
            return subtotal - subtotal / 10
        }
        return subtotal
    }
}
