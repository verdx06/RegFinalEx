//
//  HomeView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 24.01.2025.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var signViewModel = SignViewModel()
    
    @State var categoryvm: CategoryViewModel
    @State var sneakervm: SneakerViewModel
    
    @State var cartvm: CartViewModel
    @State var favoritevm: FavoriteViewModel
    
    @State var count: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        NavigationLink {
                            SideMenuView()
                        } label: {
                            Image("Hamburger")
                        }

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
                        NavigationLink {
                            SearchView(sneakers: sneakervm.sneakers, cartItems: cartvm.carts, favorite: favoritevm.favorits)
                        } label: {
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 45)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .shadow(color: .gray.opacity(0.5), radius: 3, y: 5)
                                HStack {
                                    Image("Marker-1")
                                    Text("Поиск").foregroundStyle(Color.hint)
                                    Spacer()
                                }.padding(.horizontal)
                            }
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
                            PopularView(sneakers: sneakervm.sneakers.filter({ $0.popular }), cartItems: cartvm.carts, favorits: favoritevm.favorits)
                        } label: {
                            Text("Все")
                        }

                    } .padding(.vertical)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        ForEach(sneakervm.sneakers.filter({ $0.popular }).prefix(2), id: \.self) { sneaker in
                                let cartImage = cartvm.carts.contains(where: { cartItem in
                                    cartItem.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id && cartItem.id_sneaker == sneaker.id
                                })
                                
                                let favorite = favoritevm.favorits.contains { favoriteItem in
                                    favoriteItem.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id && favoriteItem.id_sneaker == sneaker.id
                                }
                                
                                SneakerCardView(sneaker: sneaker, cart: cartImage, heart: favorite, cartItems: cartvm.carts)
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
            }
        }
    }
}
