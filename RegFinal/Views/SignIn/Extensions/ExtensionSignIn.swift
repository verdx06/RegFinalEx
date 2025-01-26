//
//  ExtensionSignIn.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import Foundation
import SwiftUI

extension SignInView {
    
    var texts: some View {
        VStack {
            Text("Привет")
                .font(.system(size: 32))
                .foregroundStyle(Color.text)
                .padding()
            
            Text("Заполните Свои Данные Или\n Продолжите Через Социальные Медиа")
                .font(.system(size: 16))
                .foregroundStyle(Color.subTextDark)
                .multilineTextAlignment(.center)
        }
    }
    
    var recover: some View {
        NavigationLink {
            ForgotPasswordView()
        } label: {
            Text("Восстановить")
                .foregroundStyle(Color.subTextDark)
                .font(.system(size: 12))
        }.padding(.vertical)

    }
    
    var footer: some View {
        HStack(spacing: 2) {
            Text("Вы впервые?")
                .foregroundStyle(Color.subTextDark)
            NavigationLink  {
                RegisterView()
            } label: {
                Text("Создать пользователя")
                    .foregroundStyle(Color.black)
            }
        }
    }
    
}
