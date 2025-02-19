//
//  PopUpView.swift
//  NacFinal
//
//  Created by Виталий Багаутдинов on 19.12.2024.
//

import SwiftUI

struct PopUpView: View {
    
    let email: String
    
    @State var isNavigate: Bool = false
    @State var isoffset: CGFloat = 1000
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.8).ignoresSafeArea()
                ZStack {
                    RoundedRectangle(cornerRadius: 10).frame(width: 350, height: 200)
                        .foregroundStyle(Color.white)
                    VStack {
                        Text("Проверьте ваш email").foregroundStyle(.black).bold().padding()
                        Text("Мы отправили код восстановления\nпароля на вашу электронную почту.").foregroundStyle(.gray)
                    }
                }.onTapGesture {
                    isNavigate = true
                    isoffset = 1000
                }
            }.offset(x: 0, y: isoffset)
                .onAppear {
                    withAnimation(.easeIn) {
                        isoffset = 0
                    }
                }
                .navigationDestination(isPresented: $isNavigate) {
                    OTPView(email: email)
                }
        }
    }
}

#Preview {
    PopUpView(email: "dewd", isoffset: 2)
}
