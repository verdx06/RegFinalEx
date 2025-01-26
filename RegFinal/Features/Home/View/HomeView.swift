//
//  HomeView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 22.01.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        VStack {
            if let currentItem = vm.currentItem {
                Text(currentItem.title)
                Text(currentItem.subtitle)
            }
            
            Button(action: vm.next, label: {
                Text("Button")
            })
        }
    }
}

#Preview {
    HomeView()
}
