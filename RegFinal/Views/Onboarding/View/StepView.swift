//
//  StepView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 23.01.2025.
//

import SwiftUI

struct StepView: View {
    let id: String
    var body: some View {
            VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(id == "1" ? Color.steponactive : Color.stepoffactive)
                            .frame(width: id == "1" ? 45 : 30)
                            .frame(height: 5)
                        
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(id == "2" ? Color.steponactive : Color.stepoffactive)
                            .frame(width: id == "2" ? 45 : 30)
                            .frame(height: 5)
                        
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(id == "3" ? Color.steponactive : Color.stepoffactive)
                            .frame(width: id == "3" ? 45 : 30)
                            .frame(height: 5)
                    }
            }
    }
}

#Preview {
    StepView(id: "1")
}
