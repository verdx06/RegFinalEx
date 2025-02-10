//
//  PopularView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 02.02.2025.
//

import SwiftUI

struct PopularView: View {
    
    let sneakers: [SneakerModel]
    let cartItems: [CartModel]
    let favorits: [FavoriteModel]
    
    @State var index: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    HStack{
                        BackButton()
                        Spacer()
                        Text("Популярное")
                        Spacer()
                        NavigationLink  {
                            FavoroteView(sneakers: sneakers, cartItems: cartItems, favorits: favorits, index: $index)
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.white)
                                    .frame(width: 44)
                                Image(systemName: "heart")
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                        ForEach(sneakers, id: \.self) { sneaker in
                            let cart = cartItems.contains { cart in
                                cart.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id && cart.id_sneaker == sneaker.id
                            }
                            let heart = favorits.contains { favorite in
                                favorite.id_sneaker == sneaker.id && favorite.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id
                            }
                            SneakerCardView(sneaker: sneaker, cart: cart, heart: heart, cartItems: cartItems)
                        }
                    })
                    Spacer()
                }.padding(.horizontal)
            }.navigationBarBackButtonHidden()
        }
    }
}

