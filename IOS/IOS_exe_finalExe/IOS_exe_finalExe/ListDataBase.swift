//
//  ListDataBase.swift
//  IOS_exe_finalExe
//
//  Created by hackeru on 25/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ListDataBase: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var items: [Double]!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
