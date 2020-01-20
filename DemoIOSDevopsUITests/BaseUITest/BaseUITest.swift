//
//  BaseUITest.swift
//  DemoIOSDevopsUITests
//
//  Created by Le Toan on 1/4/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import XCTest

class BaseUITest: XCTestCase {

    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }
}

extension BaseUITest {
    
    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given app is Ready") { _ in
            XCTAssertTrue(app.buttons["Đăng nhập"].exists)
        }
    }
}
