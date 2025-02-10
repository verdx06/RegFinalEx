//
//  RegisterView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var rvm = RegisterViewModel()
    @ObservedObject var svm = SignViewModel()
    @ObservedObject var emailValidate = EmailValidate()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                texts
                CustomTextField(title: "Ваше имя", example: "xxxxxxx", error: rvm.nameError, text: $rvm.name)
                CustomTextField(title: "Email", example: "xyz@gmail.com", error: rvm.emailError, text: $rvm.email)
                VStack(alignment: .leading, spacing: 5) {
                    CustomTextField(title: "Пароль", example: "", security: true, error: rvm.passwordError, text: $rvm.password)

                    checkbox
                    
                    CustomButton(namebuttom: "Войти в айти", progress: svm.isProgress) {
                        if rvm.checkRegister(email: rvm.email, password: rvm.password, name: rvm.name) {
                            if emailValidate.EmailValidatePredicate(email: rvm.email) {
                                svm.register(name: rvm.name, email: rvm.email, password: rvm.password)
                            }
                        }
                    }
                    
                }
                
                Spacer()
                Spacer()
                
                footer
                
            }.navigationDestination(isPresented: $svm.isNavigate, destination: {
                TabbarView()
            })
            .alert(Text("Email error"), isPresented: $emailValidate.isAlert, actions: {
                Button {
                    //
                } label: {
                    Text("Ok")
                }

            })
            .alert(Text("Password error"), isPresented: $rvm.isAlertPassword, actions: {
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
    RegisterView()
}
