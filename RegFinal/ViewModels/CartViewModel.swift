//
//  CartViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 28.01.2025.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var carts: [CartModel] = []
    @Published var isProgress: Bool = false
    
    
    func getCart() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                let getItems = try await SupabaseManager.instance.getCart()
                await MainActor.run {
                    self.carts = getItems
                    self.isProgress = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func addNewCart(sneaker: Int) {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await SupabaseManager.instance.addNewItemCart(sneaker: sneaker)
                await MainActor.run {
                    self.isProgress = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func addCart(sneaker: Int, count: Int) {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await SupabaseManager.instance.addCart(sneaker: sneaker, count: count)
                await MainActor.run {
                    self.isProgress = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteCart(sneaker: Int) {
        Task {
            do {
                try await SupabaseManager.instance.deleteCart(sneaker: sneaker)
            } catch {
                
            }
        }
    }
}
