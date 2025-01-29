//
//  ButtonCategory.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 27.01.2025.
//

import SwiftUI

struct ButtonCategory: View {
    
    let category: CategoryModel
    let isProgress: Bool
    
    let selected: Bool
    
    init(category: CategoryModel, isProgress: Bool, selected: Bool? = nil) {
        self.category = category
        self.isProgress = isProgress
        self.selected = selected ?? false
    }
    
    var body: some View {
            Text(category.title)
                .foregroundStyle(selected ? Color.white : Color.black)
                .frame(width: 104)
                .frame(height: 55)
                .background(selected ? Color.accent : Color.white)
                .cornerRadius(10)
                .padding(.trailing)

    }
}

#Preview {
    ButtonCategory(
        category: CategoryModel(
            id: 1,
            title: "Beg",
            turn: false
        ),
        isProgress: false
    )
}
