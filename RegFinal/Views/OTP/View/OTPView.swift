//
//  OTPView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 23.01.2025.
//

import SwiftUI

struct OTPView: View {
    
    let email: String
    
    @ObservedObject var fvm = ForgotViewModel()
    
    @State var verifycode: [String] = Array(repeating: "", count: 6)
    @State var error: Bool = false
    
    @State var second: Int = 60
    @State var timer: Timer?
    
    @FocusState var OTPfocus: Int?
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ForEach(0..<6, id: \.self) { index in
                        TextField("", text: $verifycode[index])
                            .keyboardType(.numberPad)
                            .frame(width: 50,height: 100)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                            .multilineTextAlignment(.center)
                            .focused($OTPfocus, equals: index)
                            .onChange(of: verifycode[index]) { oldValue, newValue in
                                
                                if !newValue.isEmpty {
                                    if index == 5{
                                        OTPfocus = nil
                                        fvm.checkOtp(email: email, code: verifycode.joined())
                                    } else {
                                        OTPfocus = (OTPfocus ?? 0) + 1
                                    }
                                } else {
                                    OTPfocus = (OTPfocus ?? 0) - 1
                                }
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 15).stroke().foregroundColor(fvm.isCode ? Color.red : Color.clear)
                            }
                        
                    }
                }
                .padding()
                HStack {
                    Button {
                        second = 60
                    } label: {
                        Text("Отправить заново")
                    }.disabled(second == 0 ? false : true)
                    Spacer()
                    Text("\(secondFormat())")
                }.padding(.horizontal)
            }.onAppear(perform: {
                timerupdate()
            })
            
            if fvm.Window {
                PasswordView(otp: verifycode.joined())
            }
            
        }
    }
    
    func timerupdate() {
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if second > 0 {
                second = second - 1
            }
        }
    }
    
    func secondFormat() -> String {
        let minute = second / 60
        let seconds = second % 60
        
        return String(format: "%02d:%02d", minute, seconds)
    }
    
}

#Preview {
    OTPView(email: "")
}
