//
//  ViewController.swift
//  IOS_UITableView_refreshControl
//
//  Created by hackeru on 21/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView : UITableView!
    var items : [String] = []
    var refreshControl : UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 10000 ... 10100{
            items.append(String(i))
        }
        
        tableView = UITableView(frame: CGRect(x: 5, y: 80, width: view.frame.width - 10, height: view.frame.height - 80), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "id")
        view.addSubview(tableView)
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handelRefresh(sender:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func handelRefresh(sender:UIRefreshControl){
        let popTime = DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds + 1 * NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: popTime) {
            self.items.append(String(10000 + self.items.count))
            self.tableView.insertRows(at: [IndexPath(row:0, section:0)], with: .automatic)
            self.refreshControl.endRefreshing()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        // Reversed data
        cell.textLabel!.text = items[items.count - indexPath.row - 1]
        return cell
    }
}

