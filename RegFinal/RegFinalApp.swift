//
//  RegFinalApp.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import SwiftUI

@main
struct RegFinalApp: App {
    
    let lastwatched: String?
    
    init() {
        lastwatched = UserDefaults.standard.string(forKey: UserDefault.lastWatched.rawValue)
        
    }
    
    var body: some Scene {
        WindowGroup {
            if lastwatched == "4" {
                ContentView()
            }
            else {
                OnboardingView()
            }
        }
    }
}
