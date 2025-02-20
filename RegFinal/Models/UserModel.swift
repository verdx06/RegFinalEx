//
//  UserModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import Foundation


struct UserModel: Codable {
    let id: UUID
    let name: String
    let email: String
    let surname: String?
    let phone: String?
}
