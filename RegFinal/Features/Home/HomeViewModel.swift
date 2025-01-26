//
//  HomeViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 22.01.2025.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var queue = Constants.queue
    @Published var currentItem: QueueItemModel? = nil
    
    @Published var isShowNextButton = false
    
    init() {
        next()
    }
    
    func next() {
        guard !queue.isEmpty else {
            return
        }
//        let brightness = UIScreen.main.brightness
//        UIScreen.main.brightness = 0.8 qr code
        
        if Constants.queue.count > queue.count {
            isShowNextButton = true
        }
        
        let first = queue.removeFirst()
        currentItem = first
    }
    
    func validateEmail() {
        
        
    }
}
