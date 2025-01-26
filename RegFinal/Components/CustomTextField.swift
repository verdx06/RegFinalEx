//
//  CustomTextField.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    let example: String
    let security: Bool?
    let error: Bool
    
    @Binding var text: String
    @State var eye: Bool = false
    
    init(title: String, example: String, security: Bool? = nil, error: Bool, text: Binding <String>, eye: Bool = false) {
        self.title = title
        self.example = example
        self.security = security
        self.error = error
        self._text = text
        self.eye = eye
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if security ?? false {
                Text(title)
                    .padding(.bottom)
                structSecureField
            } else {
                Text(title)
                    .padding(.bottom)
                structTextField
            }
            
        }.padding(.top)
    }
}

#Preview {
    SignInView()
}
