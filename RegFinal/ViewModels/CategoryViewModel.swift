//
//  CategoryViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 27.01.2025.
//

import Foundation

class CategoryViewModel: ObservableObject {
    
    @Published var categories: [CategoryModel] = []
    @Published var isProgress: Bool = false
    
    
    func getCategories() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                let getItems = try await SupabaseManager.instance.getCategory()
                await MainActor.run {
                    self.categories = getItems
                    self.isProgress = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
