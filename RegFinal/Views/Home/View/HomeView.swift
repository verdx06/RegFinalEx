//
//  HomeView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 24.01.2025.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var signViewModel = SignViewModel()
    
    var body: some View {
        Text("Hello, World!")
        Button {
            signViewModel.signOut()
        } label: {
            Text("выйти")
        }

    }
}

#Preview {
    HomeView()
}
