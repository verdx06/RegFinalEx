//
//  OnboardingView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 22.01.2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject var ovm = OnboardingViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.colorupgradient, Color.colordowngradient], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack() {
                    
                    if let currentItem = ovm.currentItem {
                        if ovm.isFirstView {
                            Text(currentItem.title)
                                .foregroundStyle(Color.white)
                                .font(.custom("Raleway-v4020-Bold", size: 40))
                                .multilineTextAlignment(.center)
                                .padding(.top)
                            Spacer()
                            ImageView(image: currentItem.image, isFirstScreen: ovm.isFirstView)
                            StepView(id: currentItem.id)
                        } else {
                            Spacer()
                            ImageView(image: currentItem.image, isFirstScreen: ovm.isFirstView)
                            Spacer()
                            Text(currentItem.title)
                                .foregroundStyle(Color.white)
                                .font(.custom("Raleway-v4020-Bold", size: 34))
                                .multilineTextAlignment(.center)
                                .padding()
                            Text(currentItem.subtitle)
                                .foregroundStyle(Color.subTextLight)
                                .font(.system(size: 16))
                                .multilineTextAlignment(.center)
                            StepView(id: currentItem.id)
                                .padding(.top)
                            
                        }
                        
                    }
                    Spacer()
                    Spacer()
                    
                    buttonNext
                    
                }
                
            }.navigationDestination(isPresented: $ovm.isNavigate) {
                SignInView()
            }
        }
            
    }
}

#Preview {
    OnboardingView()
}
