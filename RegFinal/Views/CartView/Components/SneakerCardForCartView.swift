//
//  SneakerCardForCartView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 03.02.2025.
//

import SwiftUI

struct SneakerCardForCartView: View {
    
    let sneaker: SneakerModel
    
    var body: some View {
        ZStack {
            Color.white
            HStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                        .frame(width: 80).frame(height: 80)
                        .cornerRadius(15)
                    AsyncImage(url: URL(string: sneaker.image)!) {image in
                        image
                            .resizable()
                            .scaleEffect(x: -1)
                            .frame(width: 70)
                            .frame(height: 70)
                    } placeholder: {
                        ProgressView()
                    }
                }
                VStack(alignment: .leading) {
                    Text(sneaker.name)
                        .font(.system(size: 16))
                        .padding(.bottom, 10)
                    Text("\(String(format: "%.2f", sneaker.price))")
                        .font(.system(size: 14))
                } .padding(.horizontal)
                Spacer()
            }.padding(.horizontal)
            
        }.frame(maxWidth: .infinity)
            .frame(height: 104)
    }
}

#Preview {
    SneakerCardForCartView(
        sneaker: SneakerModel(
            id: 1,
            name: "nike",
            price: 752,
            description: "description",
            categor: "Tunec",
            image: "https://cvhyzhqnpngrccwhymld.supabase.co/storage/v1/object/sign/Sneakers/firstsneakers.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJTbmVha2Vycy9maXJzdHNuZWFrZXJzLnBuZyIsImlhdCI6MTczNTExMzQ3NywiZXhwIjoxNzY2NjQ5NDc3fQ.hOiTb4-OUdwZUbDx8zu2dxczwWgtwSWwWM7BCxecOeU&t=2024-12-25T07%3A57%3A57.314Z",
            popular: true
        )
    )
}
