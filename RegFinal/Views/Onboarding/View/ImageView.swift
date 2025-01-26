//
//  ImageView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 23.01.2025.
//

import SwiftUI

struct ImageView: View {
    let image: String
    let isFirstScreen: Bool
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .scaleEffect(x: isFirstScreen ? 1 : -1)
                .frame(width: isFirstScreen ? 520 : 380)
                .frame(height: isFirstScreen ? 420 : 183)
                .rotationEffect(.degrees(-20))
            
            if isFirstScreen {
                Ellipse()
                    .foregroundColor(.black.opacity(0.3))
                    .frame(width: 235, height: 11)
                    .blur(radius: 6)
                    .padding(.top, 300)
                    .padding(.trailing, 50)
            }else {
                Ellipse()
                    .foregroundColor(.black.opacity(0.3))
                    .frame(width: 285, height: 17)
                    .blur(radius: 6)
                    .padding(.top, 300)
                    .padding(.leading, 50)
            }
            
        }
    }
}



#Preview {
    OnboardingView()
}
