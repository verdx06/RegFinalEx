//
//  SignInView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var signinvm = SignInViewModel()
    @StateObject var emailValidate = EmailValidate()
    
    @StateObject var signViewModel = SignViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                texts
                CustomTextField(title: "Email", example: "xyz@gmail.com", error: signinvm.emailError, text: $signinvm.email)
                VStack(alignment: .trailing, spacing: 5) {
                    CustomTextField(title: "Пароль", example: "", security: true, error: signinvm.passwordError, text: $signinvm.password)
                    
                    recover
                    CustomButton(namebuttom: "Войти в айти", progress: signViewModel.isProgress) {
                        if signinvm.checkSignIn(email: signinvm.email, password: signinvm.password) {
                            if emailValidate.EmailValidatePredicate(email: signinvm.email) {
                                signViewModel.signin(email: signinvm.email, password: signinvm.password)
                            }
                        }
                    }

                    
                }
                
                Spacer()
                Spacer()
                
                footer
                
            }.navigationDestination(isPresented: $signViewModel.isNavigate, destination: {
                HomeView()
            })
            .alert(Text("Email error"), isPresented: $emailValidate.isAlert, actions: {
                Button {
                    //
                } label: {
                    Text("Ok")
                }

            })
            .alert(Text("Password error"), isPresented: $signinvm.isAlertPassword, actions: {
                Button {
                    //
                } label: {
                    Text("Ok")
                }
            })
            .navigationBarBackButtonHidden()
            .padding(.horizontal)
        }
    }
}

#Preview {
    SignInView()
}
