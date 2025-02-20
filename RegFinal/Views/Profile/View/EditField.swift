//
//  EditField.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 20.02.2025.
//

import SwiftUI

struct EditField: View {
    
    let title: String
    let element: String
    @Binding var text: String
    let edit: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
            }
                ZStack {
                    TextField(element, text: $text)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.background))
                        .disabled(!edit)
                    HStack {
                        Spacer()
                        if !text.isEmpty {
                            Image("galka")
                        }
                    }.padding(.horizontal)
                }
        }
    }
}

