//
//  JSONfetcher.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/23/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import Foundation

class JSONfetcher {

    var willBeParsedData:[[String:Any]] = []

    func getJSONStringArray(completion: @escaping ([[String:Any]]?) -> Void) {
        //Create URL
        let urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/1/routes"
        guard let url = URL(string:urlString) else {
            print("BROKE ON URL CREATION")
            completion(nil)
            return
        }

        //Start URL Session
        URLSession.shared.dataTask(with:url) { (data, response, error) in
            if error != nil {
                print(error ?? "URL ERROR")
                completion(nil)
            } else {
                do {
                    self.willBeParsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
                    completion(self.willBeParsedData)
                } catch let error as NSError {
                    print(error)
                    completion(nil)
                }
            }
            }.resume()
    }
}
