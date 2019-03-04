//
//  ViewController.swift
//  IOS_http_Request
//
//  Created by hackeru on 04/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , URLSessionDataDelegate{

    var session:URLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        example5()
    }


    func example1(){
        session = URLSession(configuration: URLSessionConfiguration.default)
        let url = URL(string: "http://www.cnn.com")!
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                if let theData = data{
                    print(String(data: theData, encoding: String.Encoding.utf8)!)
                    print("is main thread? \(Thread.current.isMainThread)")
                }
            }
            self.session.finishTasksAndInvalidate()
        }
        task.resume()
    }
    
    func example2(){
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        let url = URL(string: "http://localhost:8080/IOS_server_4319_war_exploded/mainServlet")!
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                if let theData = data{
                    print(String(data: theData, encoding: String.Encoding.utf8)!)
                    print("is main thread? \(Thread.current.isMainThread)")
                }
            }
            self.session.finishTasksAndInvalidate()
        }
        
        task.resume()
    }
    
    func example4(){
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        let url = URL(string: "http://localhost:8080/IOS_server_4319_war_exploded/mainServlet")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let s = "hay server! how are you?"
        let data = s.data(using: String.Encoding.utf8)
        let task = session.uploadTask(with: urlRequest, from: data) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                if let theData = data{
                    print(String(data: theData, encoding: String.Encoding.utf8)!)
                    print("is main thread? \(Thread.current.isMainThread)")
                }
            }
            self.session.finishTasksAndInvalidate()
        }
        
        task.resume()
    }
    
    func example5(){
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        let url = URL(string: "http://localhost:8080/IOS_server_4319_war_exploded/mainServlet")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let dog = Dog(name: "Snoopy", age: 100)
        let s = "hay server! how are you?"
        let data = s.data(using: String.Encoding.utf8)
        let task = session.uploadTask(with: urlRequest, from: dog.getData()) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                if let theData = data{
                    print(String(data: theData, encoding: String.Encoding.utf8)!)
                    print("is main thread? \(Thread.current.isMainThread)")
                }
            }
            self.session.finishTasksAndInvalidate()
        }
        
        task.resume()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("did recive data")
    }
}

