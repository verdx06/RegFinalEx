//
//  SneakerCardView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 28.01.2025.
//

import SwiftUI

struct SneakerCardView: View {
    
    let sneaker: SneakerModel

    
    @State var cart: Bool
    @State var heart: Bool
    
    let cartItems: [CartModel]
    
    @ObservedObject var cartvm = CartViewModel()
    @ObservedObject var favoritevm = FavoriteViewModel()
    
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: sneaker.image)!) {image in
                    image
                        .resizable()
                        .frame(width: 130, height: 130)
                        .scaleEffect(x: -1)
                } placeholder: {
                    ProgressView()
                        .frame(width: 130, height: 130)
                        .scaleEffect(x: -1)
                }
                HStack {
                    VStack(alignment: .leading) {
                        if sneaker.popular {
                            Text("BEST SELLER")
                                .foregroundStyle(Color.accent)
                                .font(.system(size: 12))
                        }
                        Text(sneaker.name)
                            .padding(.top, 5)
                            .font(.system(size: 16))
                        Text("₽\(String(format: "%.2f", sneaker.price))")
                            .font(.system(size: 14))
                            .padding(.top, 5)
                    }
                    Spacer()
                }.padding(.bottom, 10)
                .padding(.leading, 10)
                
            }
            VStack {
                HStack {
                    Button  {
                        withAnimation(.easeIn) {
                            if heart {
                                favoritevm.deleteFavorite(sneaker: sneaker.id)
                            } else {
                                favoritevm.addFavorite(sneaker: sneaker.id)
                            }
                            heart.toggle()
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.background)
                                .frame(width: 28)
                            if favoritevm.isProgress {
                                ProgressView()
                            } else {
                                Image(systemName: heart ? "heart.fill" : "heart")
                                    .resizable().frame(width: 12, height: 10)
                                    .foregroundStyle(heart ? Color.red : Color.black)
                            }
                                
                        }.disabled(favoritevm.isProgress)
                    }
                    Spacer()
                } .padding(.leading, 10)
                    .padding(.top, 10)
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button  {
                        if !cart {
                            cartvm.addNewCart(sneaker: sneaker.id)
                            cart.toggle()
                        } else {
                            if let item = cartItems.first(where: {cartItem in
                                cartItem.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id && cartItem.id_sneaker == sneaker.id
                            }) {
                                cartvm.addCart(sneaker: sneaker.id, count: item.count)
                            }
                        }
                    } label: {
                        if cartvm.isProgress {
                            ProgressView()
                                .padding(14)
                                .foregroundStyle(Color.white)
                                .background(Color.accent)
                                .cornerRadius(15)
                        } else {
                            Image(cart ? "plusbutton" : "cartbutton")
                        }
                    }.disabled(cartvm.isProgress)

                }
            }
        }
        .frame(width: 162)
        .frame(height: 220)
        .cornerRadius(10)
    }
}

#Preview {
    SneakerCardView(
        sneaker: SneakerModel(
            id: 1,
            name: "Nike Pro",
            price: 753,
            description: "fwefwefwefwe",
            categor: "Outdoor",
            image: "https://cvhyzhqnpngrccwhymld.supabase.co/storage/v1/object/sign/Sneakers/firstsneakers.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJTbmVha2Vycy9maXJzdHNuZWFrZXJzLnBuZyIsImlhdCI6MTczNTExMzQ3NywiZXhwIjoxNzY2NjQ5NDc3fQ.hOiTb4-OUdwZUbDx8zu2dxczwWgtwSWwWM7BCxecOeU&t=2024-12-25T07%3A57%3A57.314Z", popular: true
        ),
        cart: true,
        heart: true,
        cartItems: [CartModel(
            id: UUID(),
            id_user: UUID(),
            id_sneaker: 1,
            count: 1
        )]
    )
}
