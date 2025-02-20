//
//  ProfileViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 20.02.2025.
//

import Foundation
import UIKit

class ProfileViewModel: ObservableObject {
    
    @Published var user: UserModel? {
        didSet {
            updateUserProperties()
        }
    }
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var phone: String = ""
    
    @Published var isProgress: Bool = false
    
    init() {
        getInfo()
    }
    
    func getInfo() {
        Task {
            do {
                let get = try await SupabaseManager.instance.getProfile()
                await MainActor.run {
                    self.user = get
                }
            } catch {
                // Обработка ошибок
            }
        }
    }
    
    func updateFields() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await SupabaseManager.instance.updateField(name: name, surname: surname, phone: phone)
                await MainActor.run {
                    self.isProgress = false
                    self.name = name
                    self.surname = surname
                    self.phone = phone
                }
            } catch {
                // Обработка ошибок
            }
        }
    }
    
    private func updateUserProperties() {
        guard let user = user else { return }
        name = user.name
        surname = user.surname ?? ""
        phone = user.phone ?? ""
    }
    
    func uploadPhoto(image: UIImage) {
        Task {
            do {
                guard let data = image.jpegData(compressionQuality: 1.0) else { throw URLError(.badServerResponse) }
                
                try await SupabaseManager.instance.uploadAvatar(image: data)
                
            } catch {
                print("UPLOAD ERROR " + error.localizedDescription)

            }
        }
    }
}

