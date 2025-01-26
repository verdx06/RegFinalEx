//
//  OnboardingViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 22.01.2025.
//

import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var queue = Constants.queue
    @Published var currentItem: QueueItemModel? = nil
    @Published var isButton: Bool = false
    @Published var isNavigate: Bool = false
    @Published var isFirstView: Bool = false

    init() {
        loadLastWatchedScreen()
    }
    
    func loadLastWatchedScreen() {
        if let lastwathed = UserDefaults.standard.string(forKey: UserDefault.lastWatched.rawValue) {
            if let lastItem = queue.first(where: { $0.id == lastwathed }) {
                if let index = queue.firstIndex(where: { $0.id == lastwathed }) {
                    queue.removeFirst(index)
                }
            }
        }
        next()
    }
    
    func next() {
        guard !queue.isEmpty else {
            isNavigate = true
            UserDefaults.standard.setValue("4", forKey: UserDefault.lastWatched.rawValue)
            return
        }
        
        if Constants.queue.count > queue.count {
            isButton = true
            isFirstView = false
        } else {
            isFirstView = true
        }
        
        let first = queue.removeFirst()
        
        currentItem = first
        
        saveScreen(id: first.id)
    }
    
    func saveScreen(id: String) {
        UserDefaults.standard.setValue(id, forKey: UserDefault.lastWatched.rawValue)
    }
}

