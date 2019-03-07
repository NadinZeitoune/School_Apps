//
//  ViewController.swift
//  IOS_Files_and_Folders
//
//  Created by hackeru on 07/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        example2()
    }

    // Documents folders.
    func example1(){
        // Documents folder of the app:
        let urlDocuments = FileManager().urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(urlDocuments)
        
        let cachesDirectory = FileManager().urls(for: .cachesDirectory, in: .userDomainMask)
        print(cachesDirectory)
        
        // DO NOT RELY ON THIS FOLDER!!!
        let tempDirectory = NSTemporaryDirectory()
        print(tempDirectory)
    }
    
    // Writing and read to / from file.
    func example2(){
        let destinationPath = NSTemporaryDirectory() + "Myfile.txt"
        do{
            /*// Saving string to file.
            let string = "some text"
            try string.write(toFile: destinationPath, atomically: true, encoding: String.Encoding.utf8)
            
            // Reading string from file.
            let string = try String(contentsOfFile: destinationPath, encoding: String.Encoding.utf8)
            print(string)*/
            
            /*// Saving array to file:
            let arr: NSArray = ["item1","item2","item3","item4"]
            try arr.write(toFile: destinationPath, atomically: true)
            
            // Read array from file:
            let arr = NSArray(contentsOfFile: destinationPath) as! [String]
            for s in arr{
                print(s)
            }*/
            
            // String / NSString / NSArray / NSDictionary / NSData / NSNumber / NSDate - Already have WRITE & INIT function from FILE
        }catch{
            print("error \(error)")
        }
    }
}

