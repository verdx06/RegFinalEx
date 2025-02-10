//
//  CartView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 03.02.2025.
//

import SwiftUI

struct CartView: View {
    
    let sneakers: [SneakerModel]
    let cartItems: [CartModel]
    
    @StateObject var resultvm = CheckViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    VStack {
                        HStack{
                            BackButton()
                            Spacer()
                            Text("Корзина")
                            Spacer()
                            Circle().frame(width: 30).foregroundColor(.background)
                        }
                        ForEach(sneakers, id: \.self) { sneaker in
                            if cartItems.contains(where: { cart in
                                cart.id_sneaker == sneaker.id && cart.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id
                            }) {
                                SneakerCardForCartView(sneaker: sneaker)
                            }
                        }
                        Spacer()
                    }.padding(.horizontal)
                    CheckView(cartItems: cartItems, sneakers: sneakers)
                }
                
            }.navigationBarBackButtonHidden()
        }
    }
}
