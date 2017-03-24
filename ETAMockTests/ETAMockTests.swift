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
    
    func testExample() {
        
        let mock = MockJSONfetcher()
        
        var bla :[[String:Any]] = []
        bla.append(["test": 125])
        
        stub(mock){ (mock) in
            when(mock.willBeParsedData).get.thenReturn([["routeName": "FORT ST-EUREKA RD", "daysActive": "Weekday,Saturday,Sunday", "direction1": "Northbound", "id": 1, "companyID": 1, "routeID": 125, "direction2": "Southbound"]])
        }
        
        print(mock.willBeParsedData)
        print(bla)
        
        XCTAssertEqual(mock.willBeParsedData as? String, bla as? String)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
