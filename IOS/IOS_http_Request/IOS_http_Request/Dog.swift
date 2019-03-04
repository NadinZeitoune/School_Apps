//
//  Dog.swift
//  IOS_http_Request
//
//  Created by hackeru on 04/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import Foundation

class Dog {
    public var name: String
    public var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    public func getData()->Data{
        let dogDictionary:[String:Any] = ["name": name, "age": age]
        
        do {
            return try JSONSerialization.data(withJSONObject: dogDictionary, options: .prettyPrinted)
        }catch{
            fatalError("Error!")
        }
    }
}
