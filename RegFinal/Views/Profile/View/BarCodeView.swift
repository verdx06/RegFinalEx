//
//  BarCodeView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 04.02.2025.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct BarCodeView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            Image(uiImage: generateBarCode(text: "\(String(describing: SupabaseManager.instance.supabase.auth.currentUser?.id))"))
                .resizable()
                .interpolation(.none)
                .frame(width: 300, height: 80)
            
        }
    }
    
    func generateBarCode(text: String) -> UIImage {
        let filter = CIFilter.code128BarcodeGenerator()
        let data = text.data(using: .utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let output = filter.outputImage {
            let context = CIContext()
            if let cgimage = context.createCGImage(output, from: output.extent) {
                return UIImage(cgImage: cgimage)
            }
        }
        
        return UIImage()
    }
}

#Preview {
    BarCodeView()
}
