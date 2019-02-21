//
//  ViewController.swift
//  IOS_UITableView2
//
//  Created by hackeru on 21/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var names = ["David","Moshe","Yossi"]
    var tableView : UITableView!
    //var textField : UITextField!
    var button : UIButton!
    var alertController : UIAlertController!
    let titleAdd = "Add new name"
    let titleEdit = "Edit name"
    var alertControllerAction : AlertControllerAction = .Add
    var editedRow :Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let margin : CGFloat = 5
        let top : CGFloat = 70
        
        for i in 10000..<10100 {
            names.append(String(i))
        }
        
        // table view:
        tableView = UITableView(frame: CGRect(x: margin, y: top, width: view.frame.width - 2 * margin, height: view.frame.height - top - margin * 2), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "identifier")
        view.addSubview(tableView)
        
        //button:
        let buttonWidth:CGFloat = 30
        button = UIButton(type: .contactAdd)
        button.frame = CGRect(x: view.frame.width - buttonWidth - margin, y: tableView.frame.origin.y - buttonWidth - margin, width: buttonWidth, height: buttonWidth)
        //button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClicked(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func initializeAlertController(){
        if alertController == nil{
            alertController = UIAlertController(title: "", message: "Enter name and click OK", preferredStyle: .alert)
            alertController.addTextField(configurationHandler: { (textField:UITextField) in
                textField.placeholder = "name"
            })
            let action = UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) in
                let name = self.alertController.textFields![0].text!
                self.alertController.textFields![0].text! = ""
                if name.isEmpty{
                    return
                }
                switch self.alertControllerAction{
                    case .Add:
                        self.names.append(name)
                        self.tableView.reloadData()
                        self.tableView.scrollToRow(at: IndexPath(row: self.names.count - 1, section: 0), at: .bottom, animated: true)
                    case .Edit:
                        self.names[self.editedRow] = name
                        self.tableView.reloadData()
                }
                
            })
            alertController.addAction(action)
        }
    }
    
    @objc func handleButtonClicked(sender:UIButton){
        initializeAlertController()
        
        alertController.title = titleAdd
        alertControllerAction = .Add
        present(alertController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        
        cell.textLabel!.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        initializeAlertController()
        self.editedRow = indexPath.row
        self.alertControllerAction = .Edit
        alertController.textFields![0].text = names[self.editedRow]
        alertController.title = titleEdit
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        names.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}

enum AlertControllerAction {
    case Add
    case Edit
}
