//
//  ViewController.swift
//  IOS_exe_sendPicToServer
//
//  Created by hackeru on 11/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate, URLSessionDataDelegate{
    
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
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        if let theImage = image{
            imageView.image = theImage
            httpConnection()
        }
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func httpConnection(){
        let url = URL(string: "http://localhost:8080/image")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let imageData = imageView.image?.jpegData(compressionQuality: 0.8)
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        let task = session.uploadTask(with: urlRequest, from: imageData) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                print("all good here")
            }
            
            session.finishTasksAndInvalidate()
        }
        task.resume()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

