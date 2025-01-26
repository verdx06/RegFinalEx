//
//  RegisterViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 22.01.2025.
//

import Foundation

class RegisterViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var emailError: Bool = false
    @Published var password = ""
    @Published var passwordError: Bool = false
    @Published var isAlertPassword: Bool = false
    @Published var name = ""
    @Published var nameError: Bool = false
    
    @Published var checkbox: Bool = false
    
    func checkRegister(email: String, password: String, name: String) -> Bool {
            return true
    }
    
}
