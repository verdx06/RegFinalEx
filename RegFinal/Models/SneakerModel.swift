//
//  SneakerModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 28.01.2025.
//

import Foundation


struct SneakerModel: Codable, Hashable {
    let id: Int
    let name: String
    let price: Float
    let description: String
    let categor: String
    let image: String
}
