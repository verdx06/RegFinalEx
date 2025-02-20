//
//  TabbarView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 29.01.2025.
//

import SwiftUI

struct TabbarView: View {
    
    @State var index: Int = 0
    
    @StateObject var categoryvm = CategoryViewModel()
    @StateObject var sneakervm = SneakerViewModel()
    
    @StateObject var cartvm = CartViewModel()
    @StateObject var favoritevm = FavoriteViewModel()
    
    @State var isShown: Bool = false

    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                if index == 0 {
                    HomeView(categoryvm: categoryvm, sneakervm: sneakervm, cartvm: cartvm, favoritevm: favoritevm)
                }
                else if index == 1 {
                    FavoroteView(sneakers: sneakervm.sneakers, cartItems: cartvm.carts, favorits: favoritevm.favorits, index: $index)
                }
                else if index == 4 {
                    ProfileView()
                }
                ZStack {
                    Image("tabbar")
                        .resizable()
                        .frame(height: 106)
                        .edgesIgnoringSafeArea(.all)
                    
                    CustomTabs(index: $index)
                        .padding()
                        .padding(.horizontal)
                    
                    NavigationLink  {
                        CartView(sneakers: sneakervm.sneakers, cartItems: cartvm.carts)
                    } label: {
                        Image("ButtonCartView")
                            .offset(y: -15)
                    }
                    
                }
                
            }.onAppear(perform: {
                categoryvm.getCategories()
                cartvm.getCart()
                favoritevm.getFavorite()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    sneakervm.getSneaker()
                }
            })
            
            .edgesIgnoringSafeArea(.bottom)
        }.navigationBarBackButtonHidden()
    }
}

struct CustomTabs: View {
    
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button {
                self.index = 0
            } label: {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(index == 0 ? Color.accent : Color.gray)
            }
            Spacer(minLength: 12)
            
            Button {
                self.index = 1
            } label: {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(index == 1 ? Color.accent : Color.gray)
                    
            }
            .padding(.trailing)
            Spacer().frame(width: 130)

            
            Button {
                self.index = 2
            } label: {
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(index == 2 ? Color.accent : Color.gray)
            }
            
            Spacer(minLength: 12)
            
            Button {
                self.index = 4
            } label: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(index == 4 ? Color.accent : Color.gray)
            }

        }
    }
}

#Preview {
    TabbarView()
}
