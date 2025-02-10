//
//  BarCodeGenerator.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 04.02.2025.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct BarCodeGenerator {
    let context = CIContext()
    let generator = CIFilter.code128BarcodeGenerator()

    func generateBarcode(text: String) -> Image {
        let generator = CIFilter.code128BarcodeGenerator()
        generator.message = Data(text.utf8)

        if let outputImage = generator.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {

            let uiImage = UIImage(cgImage: cgImage)

            return Image(uiImage: uiImage)
        }

        return Image(systemName: "barcode")

    }
}
