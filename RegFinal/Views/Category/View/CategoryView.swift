//
//  CategoryView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 28.01.2025.
//

import SwiftUI

struct CategoryView: View {
    
    @Environment (\.presentationMode) var presentation
    @State var selectCategory: CategoryModel
    let categories: [CategoryModel]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack(alignment: .leading) {
                    HStack{
                        Button  {
                            presentation.wrappedValue.dismiss()
                        } label: {
                            Image("Back")
                                .padding(.top)
                        }
                        Spacer()
                        Text(selectCategory.title)
                        Spacer()
                        Circle().frame(width: 40)
                            .foregroundStyle(Color.background)
                    }
                    Text("Категории")
                        .padding(.vertical)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(categories, id: \.self) { category in
                                Button  {
                                    withAnimation(.easeIn) {
                                        selectCategory = category
                                    }
                                } label: {
                                    ButtonCategory(category: category, isProgress: false, selected: selectCategory == category)
                                }
                            }
                        }
                    }
                    Spacer()
                }.padding(.horizontal)
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CategoryView(
        selectCategory: CategoryModel(
            id: 1,
            title: "dwq",
            turn: false
        ), categories: [CategoryModel(
            id: 1,
            title: "dwq",
            turn: false
        ), CategoryModel(
            id: 2,
            title: "fwe",
            turn: false
        )]
    )
}
