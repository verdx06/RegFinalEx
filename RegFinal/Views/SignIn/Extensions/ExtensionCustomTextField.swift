//
//  ExtensionCustomTextField.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import Foundation
import SwiftUI

extension CustomTextField {
    var structTextField: some View {
        ZStack {
            TextField(example, text: $text)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.background))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle())
                        .foregroundColor(error ? .red : .background)
                }
        }
    }
    
    var structSecureField: some View {
        ZStack {
            if eye {
                ZStack {
                    TextField(example, text: $text)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.background))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle())
                                .foregroundColor(error ? .red : .background)
                        }
                }
            } else {
                ZStack {
                    SecureField(example, text: $text)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.background))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle())
                                .foregroundColor(error ? .red : .background)
                        }

                }
            }
            HStack(spacing: 3) {
                if text.isEmpty {
                    ForEach(1...8, id: \.self) { _ in
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(Color.hint)
                    }
                }
                Spacer()
                Button  {
                    eye.toggle()
                } label: {
                    Image(eye ? "Eye-Open" : "Eye-Close")
                        .foregroundColor(.hint)
                }
            }.padding(.horizontal)
        }
    }
}
