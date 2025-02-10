//
//  BarCodeViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 04.02.2025.
//

import Foundation
import UIKit


class BarCodeViewModel: ObservableObject {
    @Published var lightScreen: CGFloat = UIScreen.main.brightness
    
    func lookBarCode() {
        lightScreen = UIScreen.main.brightness
        UIScreen.main.brightness = 0.8
    }
    
    func returnBrightness() {
        UIScreen.main.brightness = lightScreen
    }
}

