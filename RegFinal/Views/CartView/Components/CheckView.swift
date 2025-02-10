//
//  CheckView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 03.02.2025.
//

import SwiftUI

struct CheckView: View {
    
    @StateObject var resultvm = CheckViewModel()
    
    let cartItems: [CartModel]
    let sneakers: [SneakerModel]
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                structCheck(text: "Сумма", number: resultvm.sum)
                    .padding(.bottom)
                structCheck(text: "Доставка", number: 60)
                    .padding(.bottom)
                Divider()
                structCheck(text: "Итого", number: resultvm.sum + 60)
                    .padding(.vertical)
                
                CustomButton(namebuttom: "Оформить заказ") {
                    //
                }
                .padding(.top, 10)
                
            }.padding(.horizontal)
        }
        .onAppear(perform: {
            resultvm.result(cartItems: cartItems, sneakers: sneakers)
        })
        .frame(maxWidth: .infinity)
        .frame(height: 240)
    }
}

struct structCheck: View {
    let text: String
    let number: Float
    var body: some View {
        HStack {
            Text(text)
                .foregroundStyle( text == "Итого" ? Color.black : Color.subTextDark)
            Spacer()
            Text("₽\(String(format: "%.2f", number))")
                .foregroundStyle( text == "Итого" ? Color.accent : Color.subTextDark)
        }
    }
}
