//
//  main.swift
//  myFirstUrlConnection_client
//
//  Created by hackeru on 28/01/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import Foundation

let url = URL(string: "http://www.ynet.co.il")
let urlRequest = URLRequest(url: url!)
let session = URLSession(configuration: URLSessionConfiguration.default)
let task = session.dataTask(with: urlRequest){(data:Data?, urlResponse:URLResponse?, error:Error?) in
    if error == nil {
        if let theData = data{
            if theData.count > 0 {
                let responseFromServer = String(data: theData, encoding: String.Encoding.utf8)!
                print(responseFromServer)
            }
        }
    }else{
        print("bassa: \(error!)")
    }}
task.resume()
sleep(15)
