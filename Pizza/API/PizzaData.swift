//
//  WeatherData.swift
//  DraftUIKit
//
//  Created by Valeria Keshishyan on 23.02.2023.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let mensaje: String
    let ok: Bool
    let productos: [Producto]
}

// MARK: - Producto
struct Producto: Codable {
    let id: Int
    let nombre, descripcion: String
    let linkImagen: String?
    let precio, tasaIva: String?
    let vendible: Int
    let borrado, stockRequerido: Int?
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, nombre, descripcion, linkImagen, precio, tasaIva, vendible, borrado, stockRequerido
        case createdAt = "created_at"
    }
}
