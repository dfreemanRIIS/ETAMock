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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMock() {
        //Set up Mock
        let mock = MockJSONfetcher()
        let urlStr  = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/1/routes"
        let url  = URL(string:urlStr)!
        let testString:String = "[[\"routeName\": FORT ST-EUREKA RD, \"daysActive\": Weekday,Saturday,Sunday, \"direction1\": Northbound, \"id\": 1,\"companyID\": 1, \"routeID\": 125, \"direction2\": Southbound, \"company\": {brandcolor = \"#BC0E29\";busImgURL = \"<null>\";id = 1;logoImgURL = \"<null>\";name = SmartBus;}, \"routeNumber\": 125]]"

        stub(mock) { (mock) in
            when(mock.apiUrl).get.thenReturn(urlStr)
        }
        stub(mock) { (mock) in
            when(mock.url).get.thenReturn(url)
        }
        stub(mock) { (mock) in
            when(mock.session).get.thenReturn(URLSession())
        }
        stub(mock) { (stub) in
            stub.getSourceUrl(apiUrl: urlStr).thenReturn(url)
        }

        stub(mock) { mock in
            mock.callApi(url: equal(to:url, equalWhen: { $0 == $1 })).thenReturn(testString)
        }

        XCTAssertNotNil(mock.session)
        XCTAssertEqual(mock.callApi(url: url),testString)

        //Test parser
        let parser = customJSONparser()
        XCTAssertEqual(parser.customParse(mock.callApi(url: url)), ["125"])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
