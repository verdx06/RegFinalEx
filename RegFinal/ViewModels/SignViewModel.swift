//
//  SignViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import Foundation


class SignViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var emailError: Bool = false
    @Published var password = ""
    @Published var passwordError: Bool = false
    @Published var name = ""
    @Published var nameError: Bool = false
    
    @Published var checkbox: Bool = false
    
    @Published var isNavigate: Bool = false 
    @Published var isProgress: Bool = false
    
    func signin(email: String, password: String) { //
        Task {
            do {
                await MainActor.run {
                    self.isNavigate = false
                    self.isProgress = true
                }
                
                if isNavigate == false {
                    try await SupabaseManager.instance.signin(email: email, password: password)
                }
                
                await MainActor.run {
                    self.isProgress = false
                    self.isNavigate = true
                }
            }
            catch {
                print(error.localizedDescription)
                await MainActor.run {
                    self.isProgress = false
                    self.isNavigate = false
                }
            }
        }
    }
    
    func register(name: String, email: String, password: String) {//
        Task {
            do {
                await MainActor.run {
                    self.isNavigate = false
                    self.isProgress = true
                }
                try await SupabaseManager.instance.register(name: name, email: email, password: password)
                await MainActor.run {
                    self.isProgress = false
                    self.isNavigate = true
                }
            }
            catch {
                
            }
        }
    }
    
    func signOut() {
        Task {
            do {
                try await SupabaseManager.instance.signOut()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

