//
//  SideMenuView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 04.02.2025.
//

import SwiftUI

struct SideMenuView: View {
    
    @ObservedObject var signVm = SignViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.accent.edgesIgnoringSafeArea(.all)
                Divider().offset(y:190)
                HStack {
                    VStack(alignment: .leading) {
                        Circle().frame(width: 100)
                        Text("Имя").font(.system(size: 20)).padding(.vertical)
                        NavigationLink  {
                            TabbarView(index: 4)
                        } label: {
                            TextForeach(text: "Профиль")
                        }
                        TextForeach(text: "Корзина")
                        TextForeach(text: "Избранное")
                        TextForeach(text: "Заказы")
                        TextForeach(text: "Уведомления")
                        TextForeach(text: "Настройки")
                        Button  {
                            signVm.signOut()
                        } label: {
                            TextForeach(text: "Выйти")
                        }
                        Spacer()
                    }.padding(.horizontal)
                    Spacer()
                }.padding()
                Button  {
                    //
                } label: {
                    TabbarView()
                        .foregroundStyle(Color.black)
                }
                .cornerRadius(20)
                .offset(x: 250)
                .rotationEffect(.degrees(-2))
            }.navigationDestination(isPresented: $signVm.isNavigate, destination: {
                SignInView()
            })
            .navigationBarBackButtonHidden()
        }
    }
}

struct TextForeach: View {
    let text: String
    var body: some View {
        Text(text).font(.system(size: 20)).padding(.vertical).foregroundColor(.white)
    }
}

#Preview {
    SideMenuView()
}
