//
//  EmailValidate.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 23.01.2025.
//

import Foundation

class EmailValidate: ObservableObject {
    
    @Published var isAlert: Bool = false
    
    func EmailValidatePredicate(email: String) -> Bool {
        let emailRegex = "[a-z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if !predicate.evaluate(with: email) {
            isAlert = true
        } else {
            isAlert = false
        }
        return predicate.evaluate(with: email)
            
    }
}
