//
//  PasswordView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 19.02.2025.
//

import SwiftUI

struct PasswordView: View {
    
    let otp: String
    @State var otpcopied = false
    @State var isOfsset: CGFloat = 1000
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300,height: 200)
                .foregroundColor(Color.white)
            VStack {
                Text("Ваш пароль")
                Text(otp)
                    .onTapGesture {
                        UIPasteboard.general.string = otp
                        otpcopied = true
                        isOfsset = 1000
                    }
            }
            
        }.alert("Пароль скопирован", isPresented: $otpcopied) {
            //
        }.offset(y: 0)
            .onAppear {
                withAnimation {
                    isOfsset = 0
                }
            }
    }
}

#Preview {
    PasswordView(otp: "123")
}
