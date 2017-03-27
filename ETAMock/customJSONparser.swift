//
//  customJSONparser.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/27/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import Foundation

class customJSONparser {
    func customParse(_ jsonString:String) -> [String] {
        //Make sure the input isnt null
        if jsonString.characters.count == 0 {
            return []
        }

        //Get indexes of routeID
        let query = "routeID"
        var searchRange = jsonString.startIndex..<jsonString.endIndex
        var indexes: [String.Index] = []
        while let range = jsonString.range(of: query, options: .caseInsensitive, range: searchRange) {
            searchRange = range.upperBound..<searchRange.upperBound
            indexes.append(range.lowerBound)
        }

        var routeIds = [String]()

        //get routeIDs from jsonString
        for thisIndex in indexes {
            let start = jsonString.index(thisIndex, offsetBy: 10)
            let end = jsonString.index(start, offsetBy: 3)
            let range = start..<end
            routeIds.append(jsonString.substring(with: range))
        }

        return routeIds
    }

    func getDirectionOneStops(_ jsonString:String) -> [String] {
        //Make sure the input isnt null
        if jsonString.characters.count == 0 {
            return []
        }

        //Get indexes of stopNames
        let query = "stopName"
        var searchRange = jsonString.startIndex..<jsonString.endIndex
        var indexes: [String.Index] = []
        while let range = jsonString.range(of: query, options: .caseInsensitive, range: searchRange) {
            searchRange = range.upperBound..<searchRange.upperBound
            indexes.append(range.lowerBound)
        }

        var stopNames = [String]()

        //get stopNames from jsonString
        for thisIndex in indexes {
            let start = jsonString.index(thisIndex, offsetBy: 11)
            let end = jsonString.index(start, offsetBy: 11)
            let range = start..<end
            stopNames.append(jsonString.substring(with: range))
        }

        return stopNames
    }
}
