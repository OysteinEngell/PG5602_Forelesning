//
//  PhotoPickerView.swift
//  Forelesning_3_23
//
//  Created by Øystein Engell on 10/10/2023.
//

import SwiftUI

struct PhotoPickerView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    var didPickImage: ((UIImage) -> Void)?
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print(info)
            if let image = info(.orignialImage) as? UIImage{
                didPickImage?(image)
            }
        }
    }
    
    let sourceType: UIImagePickerController.SourceType
    init(sourceType: UIImagePickerController.SourceType){
        self.sourceType = sourceType
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = UIImagePickerController()
        viewController.sourceType = sourceType
        viewController.delegate = context.coordinator
        return viewController
    }
    
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}

#Preview{
    PhotoPickerView(sourceType: .photoLibrary)
}
