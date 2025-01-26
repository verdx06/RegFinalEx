//
//  ForgotPasswordView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 23.01.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject var fvm = ForgotViewModel()
    @ObservedObject var emailValidate = EmailValidate()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button  {
                        //
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(Color.background)
                            Image("Back")
                            
                        }
                        Spacer()
                    }
                    
                }
                Text("Забыл пароль")
                    .font(.custom("Raleway-v4020-Bold", size: 32))
                    .font(.system(size: 32))
                    .foregroundStyle(Color.text)
                    .padding(10)
                
                Text("Введите свою учетную запись\nдля сброса")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.subTextDark)
                    .multilineTextAlignment(.center)
                
                CustomTextField(title: "", example: "xyz@gmail.com", error: fvm.emailError, text: $fvm.email)
                
                    .padding(.bottom)
                
                CustomButton(namebuttom: "Отправить") {
                    if fvm.checkEmail() {
                        if emailValidate.EmailValidatePredicate(email: fvm.email) {
                            fvm.isNavigate = true
                        }
                    }
                }.padding(.vertical)
                
                Spacer()
                
            }.alert("Email Error", isPresented: $emailValidate.isAlert, actions: {
                Text("Ok")
            })
            .navigationDestination(isPresented: $fvm.isNavigate, destination: {
                OTPView()
            })
            .navigationBarBackButtonHidden()
            .padding(.horizontal)
        }
    }
}

#Preview {
    ForgotPasswordView()
}
