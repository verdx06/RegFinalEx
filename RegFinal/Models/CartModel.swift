//
//  CartModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 28.01.2025.
//

import Foundation

struct CartModel: Codable {
    let id: UUID
    let id_user: UUID
    let id_sneaker: Int
    let count: Int
}
