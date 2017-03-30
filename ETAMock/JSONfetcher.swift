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
    
    /// Asynchronously retrieves a string representation of data from a given url
    ///
    /// - Parameter url:        A Url object we want data from
    /// - Parameter completion: A closure which is called with the data
    func callApi(url:URL, completion: @escaping (String) -> ()) {
        session = URLSession(configuration: .default)
        var outputdata:String = ""
        let task = session?.dataTask(with: url as URL) { (data, _, _) -> Void in
            if let data = data {
                outputdata = String(data: data, encoding: String.Encoding.utf8)!
                completion(outputdata)
            }
        }
        task?.resume()
    }
}
