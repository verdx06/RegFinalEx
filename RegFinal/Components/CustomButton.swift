//
//  CustomButton.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import SwiftUI

struct CustomButton: View {
    
    let namebuttom: String
    let progress: Bool
    let action: ()->()
    
    init(namebuttom: String, progress: Bool? = nil, action: @escaping () -> Void) {
        self.namebuttom = namebuttom
        self.progress = progress ?? false
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            if progress {
                ProgressView()
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.accent)
                    .cornerRadius(10)
            }else {
                Text(namebuttom)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.accent)
                    .cornerRadius(10)
            }
        }.disabled(progress)

    }
}
