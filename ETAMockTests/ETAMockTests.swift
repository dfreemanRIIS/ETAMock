//
//  ETAMockTests.swift
//  ETAMockTests
//
//  Created by Donald Freeman on 3/22/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import XCTest
import Cuckoo
@testable import ETAMock

class ETAMockTests: XCTestCase {
    
    var urlStr:String!
    var url:URL!
    var testJson:String!

    override func setUp() {
        super.setUp()
        urlStr  = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/1/routes"
        url  = URL(string:urlStr)!
        testJson = "[[\"routeName\": FORT ST-EUREKA RD, \"daysActive\": Weekday,Saturday,Sunday, \"direction1\": Northbound, \"id\": 1,\"companyID\": 1, \"routeID\": 125, \"direction2\": Southbound, \"company\": {brandcolor = \"#BC0E29\";busImgURL = \"<null>\";id = 1;logoImgURL = \"<null>\";name = SmartBus;}, \"routeNumber\": 125]]"
    }

    func testMock() {
        //Set up Mock
        let mock = MockJSONfetcher()
        stub(mock) { mock in
            mock.callApi(url: equal(to:url, equalWhen: { $0 == $1 })).thenReturn(testJson)
        }
        XCTAssertEqual(mock.callApi(url: url),testJson)

        //Test parser
        let parser = customJSONparser()
        XCTAssertEqual(parser.customParse(mock.callApi(url: url)), ["125"])
    }
}
