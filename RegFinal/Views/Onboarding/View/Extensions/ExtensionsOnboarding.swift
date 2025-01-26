//
//  ExtensionsOnboarding.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 23.01.2025.
//

import Foundation
import SwiftUI

extension OnboardingView {
    var buttonNext: some View {
        Button {
            withAnimation(.easeIn) {
                ovm.next()
            }
        } label: {
            Text(ovm.isButton ? "Дальше" : "Начать")
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .foregroundStyle(Color.black)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, ovm.isFirstView ? 80 : 15)
                .padding(.top)
        }
        }
}
