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
    @Published var Window: Bool = false
    @Published var emailError: Bool = false
    @Published var isAlert: Bool = false
    @Published var isCode: Bool = false
    
    func checkEmail() -> Bool{
        self.emailError = email.isEmpty ? true : false
        self.isAlert = emailError
        
        if emailError {
            return false
        } else {
            return true
        }
        
    }
    
    func sendCode(email: String) {
        Task {
            do {
                try await SupabaseManager.instance.resetPassword(email: email)
                await MainActor.run {
                    self.isNavigate = true
                }
            } catch {
                print(" send: \(error.localizedDescription)")
            }
        }
    }
    
    func checkOtp(email: String, code: String) {
        Task {
            do {
                try await SupabaseManager.instance.resetPassword(email: email)
                await MainActor.run {
                    self.isCode = false
                    self.Window = true
                }
            } catch {
                await MainActor.run {
                    self.isCode = true
                }
                print(error.localizedDescription)
            }
        }
    }
    
    func updatePassword(code: String) {
        Task {
            do {
                try await SupabaseManager.instance.updatePassword(password: code)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
