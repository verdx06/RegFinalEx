//
//  SearchView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 30.01.2025.
//

import SwiftUI

struct SearchView: View {
    
    @State var text: String = ""
    
    @FocusState var focussearch: Bool
    
    @ObservedObject var searchvm = SearchViewModel()
    
    let sneakers: [SneakerModel]
    let cartItems: [CartModel]
    let favorite: [FavoriteModel]
    
    var filteredItems: [SneakerModel] {
        if !text.isEmpty {
            return sneakers.filter { $0.name.lowercased().contains(text.lowercased()) }
        }
        else {
            return []
        }
    }
    
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    BackButton()
                    Spacer()
                    Text("Поиск")
                    Spacer()
                    Circle().foregroundColor(.background).frame(width: 30)
                }
                ZStack {
                    TextField("Поиск", text: $text)
                        .keyboardType(.webSearch)
                        .padding(.horizontal, 45)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.5), radius: 3, y: 5)
                        .focused($focussearch)
                        .onChange(of: focussearch) { oldValue, newValue in
                            if newValue == false && !text.isEmpty {
                                searchvm.search.append(text)
                                searchvm.save()
                            }
                        }
                    HStack {
                        Image("Marker-1")
                        Spacer()
                    }.padding(.horizontal)
                }.padding(.bottom)
                ScrollView {
                    if text.isEmpty {
                        ForEach(searchvm.search.reversed(), id: \.self) { item in
                            ElementSearch(name: item, text: $text)
                                .padding(.top)
                        }
                        if searchvm.search.isEmpty {
                            Text("empty kakogoto hyua")
                        }
                    } else {
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                            ForEach(filteredItems, id: \.self) { sneaker in
                                let cartItem = cartItems.contains { $0.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id && $0.id_sneaker == sneaker.id }
                                let favoiteItem = favorite.contains { $0.id_user == SupabaseManager.instance.supabase.auth.currentUser?.id && $0.id_sneaker == sneaker.id }
                                SneakerCardView(sneaker: sneaker, cart: cartItem, heart: favoiteItem, cartItems: cartItems)
                            }
                        })
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .onAppear {
                focussearch = true
            }
            
        }.navigationBarBackButtonHidden()
    }
    
}
struct ElementSearch: View {
    
    let name: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Button  {
                    text = name
                } label: {
                    HStack {
                        Image("Time")
                        Text(name)
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                    }
                }
            }
            Spacer()
        }
    }
}
