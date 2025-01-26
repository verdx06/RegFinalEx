//
//  ForgotViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 23.01.2025.
//

import Foundation


class ForgotViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var isNavigate: Bool = false
    @Published var emailError: Bool = false
    @Published var isAlert: Bool = false
    
    func checkEmail() -> Bool{
        self.emailError = email.isEmpty ? true : false
        self.isAlert = emailError
        
        if emailError {
            return false
        } else {
            return true
        }
        
    }
    
}
