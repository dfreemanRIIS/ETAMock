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
    var testRouteJson:String!
    var testStopJson:String!

    override func setUp() {
        super.setUp()
        urlStr  = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/1/routes"
        url  = URL(string:urlStr)!
        testRouteJson = "[[\"routeName\": FORT ST-EUREKA RD, \"daysActive\": Weekday,Saturday,Sunday, \"direction1\": Northbound, \"id\": 1,\"companyID\": 1, \"routeID\": 125, \"direction2\": Southbound, \"company\": {brandcolor = \"#BC0E29\";busImgURL = \"<null>\";id = 1;logoImgURL = \"<null>\";name = SmartBus;}, \"routeNumber\": 125]]"
        testStopJson = "[{\"stopID\":\"13775\",\"stopName\":\"Gratiot + Grand Blvd\",\"latitude\":\"42.37342418\",\"longitude\":\"-83.01816031\",\"order\":1,\"stopTimes\":[\"5:28AM\",\"6:13AM\",\"6:59AM\",\"7:45AM\",\"8:30AM\",\"9:15AM\",\"10:00AM\",\"10:55AM\",\"11:41AM\",\"12:26PM\",\"1:11PM\",\"1:56PM\",\"2:42PM\",\"3:27PM\",\"4:12PM\",\"4:57PM\",\"5:42PM\",\"6:27PM\",\"7:11PM\",\"7:56PM\",\"8:51PM\",\"9:36PM\",\"10:21PM\",\"11:21PM\",\"12:21AM\"]},{\"stopID\":\"18273\",\"stopName\":\"Gratiot + St Antoine\",\"latitude\":\"42.33851162\",\"longitude\":\"-83.04239333\",\"order\":2,\"stopTimes\":[]},{\"stopID\":\"19804\",\"stopName\":\"Broadway + Crocker\",\"latitude\":\"42.59723495\",\"longitude\":\"-82.87674594\",\"order\":3,\"stopTimes\":[]}]"
    }

    func testRoutes() {
        //Set up Mock
        let mock = MockJSONfetcher()
        stub(mock) { mock in
            mock.callApi(url: equal(to:url, equalWhen: { $0 == $1 })).thenReturn(testRouteJson)
        }
        XCTAssertEqual(mock.callApi(url: url),testRouteJson)

        //Test parser
        let parser = customJSONparser()
        XCTAssertEqual(parser.customParse(mock.callApi(url: url)), ["125"])
    }
    
    func testStops() {
        //Set up Mock
        let mock = MockJSONfetcher()
        stub(mock) { mock in
            mock.callApi(url: equal(to:url, equalWhen: { $0 == $1 })).thenReturn(testStopJson)
        }
        XCTAssertEqual(mock.callApi(url: url),testStopJson)
        
        //Test parser
        let parser = customJSONparser()
        XCTAssertEqual(parser.getDirectionOneStops(mock.callApi(url: url)), ["Gratiot + Grand Blvd", "Gratiot + St Antoine", "Broadway + Crocker"])
    }
}
