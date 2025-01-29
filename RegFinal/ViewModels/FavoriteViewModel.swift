//
//  FavoriteViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 28.01.2025.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    
    @Published var favorits: [FavoriteModel] = []
    @Published var isProgress: Bool = false
    
    
    func getFavorite() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                let getItems = try await SupabaseManager.instance.getFavorite()
                await MainActor.run {
                    self.favorits = getItems
                    self.isProgress = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func addFavorite(sneaker: Int) {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await SupabaseManager.instance.addFavorite(sneaker: sneaker)
                await MainActor.run {
                    self.isProgress = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteFavorite(sneaker: Int) {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await SupabaseManager.instance.deleteFavorite(sneaker: sneaker)
                await MainActor.run {
                    self.isProgress = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}
