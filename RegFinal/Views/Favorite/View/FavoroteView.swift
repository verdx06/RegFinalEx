//
//  FavoroteView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 03.02.2025.
//

import SwiftUI

struct FavoroteView: View {
    
    let sneakers: [SneakerModel]
    let cartItems: [CartModel]
    let favorits: [FavoriteModel]
    
    @Binding var index: Int
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    HStack {
                        if index == 1 {
                            Button {
                                index = 0
                            } label: {
                                Image("backLight")
                            }
                        } else {
                            BackButton()
                        }
                        Spacer()
                        Text("Избранное")
                        Spacer()
                        Circle().frame(width: 30).foregroundColor(.background)
                    }
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                        ForEach(sneakers, id: \.self) { sneaker in
                            if favorits.contains(where: { favorite in
                                favorite.id_sneaker == sneaker.id && favorite.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id
                            }) {
                                let cart = cartItems.contains { item in
                                    item.id_sneaker == sneaker.id && SupabaseManager.instance.supabase.auth.currentUser?.id == item.id_user
                                }
                                SneakerCardView(sneaker: sneaker, cart: cart, heart: true, cartItems: cartItems)
                            }
                        }
                    })
                    Spacer()
                }.padding(.horizontal)
            }.navigationBarBackButtonHidden()
        }
    }
}
