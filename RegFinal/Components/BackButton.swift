//
//  BackButton.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 30.01.2025.
//

import SwiftUI

struct BackButton: View {
    
    @Environment (\.presentationMode) var presentation
    
    var body: some View {
        Button {
            presentation.wrappedValue.dismiss()
        } label: {
            Image("backLight")
        }

    }
}

#Preview {
    BackButton()
}
