//
//  SearchViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 03.02.2025.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var search: [String] = []
    
    init() {
        load()
    }
    
    func save() {
        UserDefaults.standard.setValue(search, forKey: "search")
    }
    
    func load() {
        if let savedItems = UserDefaults.standard.array(forKey: "search") as? [String] {
            search = savedItems
        }
    }

    
}
