//
//  SearchModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 03.02.2025.
//

import Foundation

struct SearchModel: Codable, Hashable {
    let id: UUID
    let id_user: UUID
    let searchtext: String
}
