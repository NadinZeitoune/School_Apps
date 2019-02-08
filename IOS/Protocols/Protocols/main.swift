//
//  main.swift
//  Protocols
//
//  Created by hackeru on 31/01/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import Foundation

protocol MyProtocol {
    func myFunc()
}

class MyClass: MyProtocol {
    func myFunc() {
        print("in my func")
    }
    func myOtherFunc() {
        
    }
}

let myobject:MyProtocol = MyClass()
myobject.myFunc()
if myobject is MyClass{
    let m = myobject as! MyClass
    m.myOtherFunc()
}












