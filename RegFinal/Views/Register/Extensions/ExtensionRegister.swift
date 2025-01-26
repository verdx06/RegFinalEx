//
//  ExtensionRegister.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import Foundation
import SwiftUI

extension RegisterView {
    
    var texts: some View {
        VStack {
            Text("Регистрация")
                .font(.system(size: 32))
                .foregroundStyle(Color.text)
                .padding()
            
            Text("Заполните Свои Данные Или\nПродолжите Через Социальные Медиа")
                .font(.system(size: 16))
                .foregroundStyle(Color.subTextDark)
                .multilineTextAlignment(.center)
        }
    }
    
    var recover: some View {
        Button {
            //
        } label: {
            Text("Восстановить")
                .foregroundStyle(Color.subTextDark)
                .font(.system(size: 12))
        }.padding(.vertical)
    }
    
    var footer: some View {
        HStack(spacing: 2) {
            Text("Есть аккаунт?")
                .foregroundStyle(Color.subTextDark)
            NavigationLink  {
                SignInView()
            } label: {
                Text("Войти")
                    .foregroundStyle(Color.black)
            }
        }
    }
    
    var checkbox: some View {
        HStack {
            Button {
                rvm.checkbox.toggle()
            } label: {
                if rvm.checkbox {
                    ZStack {
                        Image(systemName: "square")
                            .cornerRadius(5)
                            .foregroundColor(.background)
                            .background(Color.background)
                        Image("Vector")
                    }
                }else {
                    Image(systemName: "square")
                        .cornerRadius(5)
                        .foregroundColor(.background)
                        .background(Color.background)
                }
            }
            .padding(.vertical)
            
            NavigationLink  {
                PDFKitView()
            } label: {
                Text("Даю согласие на обработку\nперсональных данных").underline().multilineTextAlignment(.leading)
                    .padding(.vertical)
                    .foregroundColor(.text)
            }
            
        }
    }
    
}
