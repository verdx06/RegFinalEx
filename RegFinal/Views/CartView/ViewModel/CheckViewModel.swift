//
//  CheckViewModel.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 03.02.2025.
//

import Foundation
import SwiftUI

class CheckViewModel: ObservableObject {
    @Published var sum: Float = 0
    
    func result(cartItems: [CartModel], sneakers: [SneakerModel]) {
        for sneaker in sneakers {
            for cart in cartItems {
                if cart.id_sneaker == sneaker.id && cart.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id {
                    sum = sum + sneaker.price * Float(cart.count)
                }
            }
        }
    }
    
}

