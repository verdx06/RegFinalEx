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
            return false

    }
    
}

