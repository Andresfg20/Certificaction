package business_opt

import std.collection.*

public struct LineaPedido {
    public let producto: String
    public let precioUnitario: Int64
    public let cantidad: Int64

    public init(producto: String, precioUnitario: Int64, cantidad: Int64) {
        if (precioUnitario < 0 || cantidad <= 0) {
            throw IllegalArgumentException("Línea de pedido inválida: ${producto}")
        }
        this.producto = producto
        this.precioUnitario = precioUnitario
        this.cantidad = cantidad
    }

    public func subtotal(): Int64 {
        return precioUnitario * cantidad
    }
}

public class Pedido {
    public let id: Int64
    public let cliente: String
    private let lineas = ArrayList<LineaPedido>()

    public init(id: Int64, cliente: String) {
        this.id = id
        this.cliente = cliente
    }

    public func agregar(linea: LineaPedido): Pedido {
        lineas.add(linea)
        return this
    }

    public func subtotal(): Int64 {
        var s: Int64 = 0
        for (l in lineas) {
            s += l.subtotal()
        }
        return s
    }

    public func total(politica: PoliticaDescuento): Int64 {
        return politica.aplicar(subtotal())
    }
}

// Devuelve la política que deja el menor total para el cliente.
public func mejorPolitica(pedido: Pedido, politicas: Array<PoliticaDescuento>): PoliticaDescuento {
    if (politicas.size == 0) {
        throw IllegalArgumentException("Se necesita al menos una política")
    }
    var mejor = politicas[0]
    for (p in politicas) {
        if (pedido.total(p) < pedido.total(mejor)) {
            mejor = p
        }
    }
    return mejor
}
