//
//  MyClass.swift
//  IOS_UITableView_refreshControl
//
//  Created by hackeru on 21/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class MyClass {
    private var _name:String
    
    init(name : String) {
        self._name = name
    }
    
    public var name:String{
        get{
            return _name
        }
        set{
            self._name = newValue
        }
    }
}
