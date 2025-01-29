//
//  SneakerViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 28.01.2025.
//

import Foundation

class SneakerViewModel: ObservableObject {
    @Published var sneakers: [SneakerModel] = []
    
    @Published var isProgress: Bool = false
    
    func getSneaker() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                let getItems = try await SupabaseManager.instance.getSneakers()
                await MainActor.run {
                    self.sneakers = getItems
                    self.isProgress = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
