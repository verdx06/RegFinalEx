//
//  ImagePicker.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 20.02.2025.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var avatarImage: UIImage?
    let sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vs = UIImagePickerController()
        vs.delegate = context.coordinator
        vs.allowsEditing = true
        vs.sourceType = sourceType
        
        return vs
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: ImagePicker
        init(photoPicker: ImagePicker) {
            self.photoPicker = photoPicker
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPicker.avatarImage = image
            } else {
                //
            }
            picker.dismiss(animated: true)
        }
    }
    
}

