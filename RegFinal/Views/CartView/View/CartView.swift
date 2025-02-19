//
//  CartView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 03.02.2025.
//

import SwiftUI

struct CartView: View {
    
    var sneakers: [SneakerModel]
    let cartItems: [CartModel]
    
    @StateObject var resultvm = CheckViewModel()
    @ObservedObject var cvm = CartViewModel()
    
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
                                HStack {
                                    
                                
                                SneakerCardForCartView(sneaker: sneaker)
                                    Button {
                                        cvm.deleteCart(sneaker: sneaker.id)
                                    } label: {
                                        Image("Delete")
                                    }
                                }
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
