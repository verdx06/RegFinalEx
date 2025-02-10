//
//  ProfileView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 04.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State var text: String = ""
    
    @State var isBarCode: Bool = false
    @StateObject var barcodevm = BarCodeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack() {
                    HStack {
                        Image("Hamburger")
                        Spacer()
                        ZStack {
                            Text("Профиль")
                        }
                        Spacer()
                    }
                    Circle().frame(width: 96)
                        .padding(.top, 45)
                    Text("name")
                    
                    Button {
                        barcodevm.lookBarCode()
                        isBarCode = true
                    } label: {
                        Image("barcodeimage")
                    }
                    
                    
                    CustomTextField(title: "Имя", example: "", error: false, text: $text)
                    
                    CustomTextField(title: "Фамилия", example: "", error: false, text: $text)
                    
                    CustomTextField(title: "Адрес", example: "", error: false, text: $text)
                    
                    CustomTextField(title: "Телефон", example: "", error: false, text: $text)
                    
                    Spacer()
                }
                    .padding(.horizontal)
                if isBarCode {
                    Button  {
                        barcodevm.returnBrightness()
                        isBarCode = false
                    } label: {
                        BarCodeView()
                    }
                }
            }.navigationBarBackButtonHidden()
            
            
        }
    }
}

#Preview {
    ProfileView()
}
