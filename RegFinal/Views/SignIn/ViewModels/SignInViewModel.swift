//
//  SignInViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 22.01.2025.
//

import Foundation

class SignInViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var emailError: Bool = false
    @Published var password = ""
    @Published var isAlertPassword: Bool = false
    @Published var passwordError: Bool = false
    
    
    func checkSignIn(email: String, password: String) -> Bool {
        self.emailError = email.isEmpty ? true : false
        self.passwordError = password.isEmpty ? true : false
        self.passwordError = password.count <= 5 ? true : false
        self.isAlertPassword = passwordError
        if emailError || passwordError {
            return false
        } else {
            return true
        }
    }
    
}

