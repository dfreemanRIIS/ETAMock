//
//  JSONparser.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/23/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import Foundation

class JSONParser {

    func getParsedJSON(willBeParsedData:[[String:Any]]) -> [String]{
        var stringArray:[String] = []
        for data in willBeParsedData {
            let parsedData = data["routeID"] as! String
            stringArray.append(parsedData)
        }
        return stringArray
    }
}
