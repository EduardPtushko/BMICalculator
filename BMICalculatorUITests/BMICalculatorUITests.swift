//
//  BMICalculatorUITests.swift
//  BMICalculatorUITests
//
//  Created by Eduard Ptushko on 19.02.2024.
//

import XCTest

final class BMICalculatorUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false

        app.launch()
    }

    override func tearDownWithError() throws {}

    func testExample() throws {
        let calculateButton = app.buttons["CALCULATE"]
        XCTAssertTrue(calculateButton.exists)
        calculateButton.tap()
//        let recalculateButton = app.buttons["RE-CALCULATE"]
        let recalculateButton = app.staticTexts["RE-CALCULATE"].waitForExistence(timeout: 1)
//        XCTAssertTrue(app.staticTexts["RE-CALCULATE"].waitForExistence(timeout: 1))
//        XCTAssertFalse(calculateButton.isHittable)
    }

    func testChooseButtons() throws {
        let buttons = app.buttons
        print(buttons)
    }
}
