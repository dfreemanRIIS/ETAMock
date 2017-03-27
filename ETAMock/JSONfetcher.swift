//
//  JSONfetcher.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/23/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import Foundation

class JSONfetcher {
    var url:URL?
    var session:URLSession?
    var apiUrl:String?

    func getSourceUrl(apiUrl:String) -> URL {
        url = URL(string:apiUrl)
        return url!
    }
        
    func callApi(url:URL) -> String {
        session = URLSession(configuration: .default)
        var outputdata:String = ""
        let task = session?.dataTask(with: url as URL) { (data, _, _) -> Void in
            if let data = data {
                outputdata = String(data: data, encoding: String.Encoding.utf8)!
            }
        }
        task?.resume()
        sleep(1)
        return outputdata
    }
}
