//
//  ETAMockUITests.swift
//  ETAMockUITests
//
//  Created by Donald Freeman on 3/22/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import XCTest

class ETAMockUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testExample() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Smart"].tap()
        tablesQuery.staticTexts["SOUTHSHORE"].tap()
        app.buttons["Southbound"].tap()
        XCTAssert(tablesQuery.staticTexts["JEFFERSON + SOUTHFIELD"].exists)
        
        
        app.navigationBars["ETAMock.StopsView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        tablesQuery.staticTexts["MICHIGAN AVENUE LOCAL"].tap()
        app.buttons["Westbound"].tap()
        XCTAssert(tablesQuery.staticTexts["MICHIGAN + CASS"].exists)
    }
}
