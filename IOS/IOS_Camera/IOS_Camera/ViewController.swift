//
//  ViewController.swift
//  IOS_Camera
//
//  Created by hackeru on 11/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var btnShowImagePicker: UIButton!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnShowImagePicker = UIButton(type: .system)
        btnShowImagePicker.setTitle("click", for: .normal)
        btnShowImagePicker.frame = CGRect(x: (view.frame.width - 120.0) / 2, y: 40, width: 120, height: 30)
        btnShowImagePicker.addTarget(self, action: #selector(handleImagePickerController), for: .touchUpInside)
        view.addSubview(btnShowImagePicker)
        
        imageView = UIImageView(frame: CGRect(x: 5, y: btnShowImagePicker.frame.maxY + 5, width: view.frame.width - 5 - 5, height: 250))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    @objc func handleImagePickerController() {
        let src = UIImagePickerController.SourceType.photoLibrary
        
        /* Same as below
         if !UIImagePickerController.isSourceTypeAvailable(src){
            return
         }*/
        guard UIImagePickerController.isSourceTypeAvailable(src) else {
            return
        }
        
        guard let arr = UIImagePickerController.availableMediaTypes(for: src) else {
            return
        }
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = src
        imagePickerController.mediaTypes = arr
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("did finish picking")
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let url = info[UIImagePickerController.InfoKey.imageURL] as? URL
        if let theUrl = url{
            print("the url is: \(theUrl)")
        }
        if let theImage = image{
            imageView.image = theImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("did cancel")
        picker.dismiss(animated: true, completion: nil)
    }
}

