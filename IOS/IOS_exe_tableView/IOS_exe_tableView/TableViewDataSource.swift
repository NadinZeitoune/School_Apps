//
//  TableViewDataSource.swift
//  IOS_exe_tableView
//
//  Created by hackeru on 18/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class TableViewDataSource : NSObject, UITableViewDataSource{
    var dataArr : [String]
    
    
    init(_ dataArr:[String]) {
        self.dataArr = dataArr
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "identifier")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "identifier")
        }
        
        cell!.textLabel!.text = "\(self.dataArr[indexPath.row])"
        
        return cell!
    }
}
