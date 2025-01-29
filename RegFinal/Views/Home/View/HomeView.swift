//
//  HomeView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 24.01.2025.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var signViewModel = SignViewModel()
    @State var text: String = ""
    
    @StateObject var categoryvm = CategoryViewModel()
    @StateObject var sneakervm = SneakerViewModel()
    
    @StateObject var cartvm = CartViewModel()
    @StateObject var favoritevm = FavoriteViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        Image("Hamburger")
                        Spacer()
                        ZStack {
                            Text("Главная")
                                .font(.system(size: 32))
                            Image("krujok")
                                .offset(x: -65, y: -15)
                        }
                        Spacer()
                        Button {
                            //
                        } label: {
                            Circle()
                                .frame(width: 30)
                        }
                        
                    }
                    HStack {
                        ZStack {
                            TextField("", text: $text)
                                .padding(.horizontal, 45)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .gray.opacity(0.5), radius: 3, y: 5)
                            HStack {
                                Image("Marker-1")
                                Spacer()
                            }.padding(.horizontal)
                        }
                        Button  {
                            //
                        } label: {
                            Circle()
                                .frame(width: 55)
                        }
                        .padding(.leading, 5)
                        
                    }
                    Text("Категории")
                        .padding(.vertical)
                    
                    categories
                    
                    HStack {
                        Text("Популярное")
                        Spacer()
                        NavigationLink  {
                            //
                        } label: {
                            Text("Все")
                        }

                    } .padding(.vertical)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        ForEach(sneakervm.sneakers, id: \.self) { sneaker in
                            if sneaker.id <= 2 {
                                
                                let cartImage = cartvm.carts.contains(where: { cartItem in
                                    cartItem.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id && cartItem.id_sneaker == sneaker.id
                                })
                                
                                let favorite = favoritevm.favorits.contains { favoriteItem in
                                    favoriteItem.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id && favoriteItem.id_sneaker == sneaker.id
                                }
                                
                                SneakerCardView(sneaker: sneaker, cart: cartImage, heart: favorite, cartItems: cartvm.carts)
                            }
                        }
                    }
                    
                    HStack {
                        Text("Акции")
                        Spacer()
                        Button {
                            //
                        } label: {
                            Text("Все")
                        }
                        
                    }.padding(.top)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.white)
                        Text("Акцияяя")
                    }
                    .frame(maxWidth: .infinity).frame(height: 95)
                    
                    Spacer()
                } .padding(.horizontal)
            }.onAppear(perform: {
                categoryvm.getCategories()
                cartvm.getCart()
                favoritevm.getFavorite()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    sneakervm.getSneaker()
                }
            })
        }
    }
}

#Preview {
    HomeView()
}
