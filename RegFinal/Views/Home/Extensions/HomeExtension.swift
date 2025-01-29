//
//  HomeExtension.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 28.01.2025.
//

import Foundation
import SwiftUI


extension HomeView {
    
    var categories: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(categoryvm.categories, id: \.self) { category in
                    NavigationLink  {
                        CategoryView(selectCategory: category, categories: categoryvm.categories)
                    } label: {
                        ButtonCategory(category: category, isProgress: categoryvm.isProgress)
                    }
                    
                }
            }
        }
    }
    
}
