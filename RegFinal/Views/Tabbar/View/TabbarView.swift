//
//  TabbarView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 29.01.2025.
//

import SwiftUI

struct TabbarView: View {
    
    @State var index: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                if index == 0 {
                    HomeView()
                }
                ZStack {
                    Image("tabbar")
                        .resizable()
                        .frame(height: 106)
                        .edgesIgnoringSafeArea(.all)
                    
                    CustomTabs(index: $index)
                        .padding()
                        .padding(.horizontal)
                    
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct CustomTabs: View {
    
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button {
                self.index = 0
            } label: {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(index == 0 ? Color.accent : Color.gray)
            }
            Spacer(minLength: 12)
            
            Button {
                self.index = 1
            } label: {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(index == 1 ? Color.accent : Color.gray)
                    
            }
            .padding(.trailing)
            Spacer().frame(width: 130)

            
            Button {
                self.index = 2
            } label: {
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(index == 2 ? Color.accent : Color.gray)
            }
            
            Spacer(minLength: 12)
            
            Button {
                self.index = 3
            } label: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(index == 3 ? Color.accent : Color.gray)
            }

        }
    }
}

#Preview {
    TabbarView()
}
