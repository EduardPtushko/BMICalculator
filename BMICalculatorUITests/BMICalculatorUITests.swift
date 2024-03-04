//
//  BMICalculatorUITests.swift
//  BMICalculatorUITests
//
//  Created by Eduard Ptushko on 04.03.2024.
//

import XCTest

final class BMICalculatorUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {}

    func testContentView() throws {

        let title = app.staticTexts["BMI CALCULATOR"]
        XCTAssertTrue(title.exists)

        let male = app.buttons["maleButton"]
        let maleImage = male.descendants(matching: .image).element

        XCTAssertTrue(maleImage.exists)
        XCTAssertEqual(maleImage.label, "male_symbol")
        XCTAssertTrue(male.exists)
        XCTAssertEqual(male.label, "MALE")
        male.tap()

        let female = app.buttons["femaleButton"]
        let femaleImage = female.descendants(matching: .image).element

        XCTAssertTrue(femaleImage.exists)
        XCTAssertEqual(femaleImage.label, "female_symbol")
        XCTAssertTrue(female.exists)
        XCTAssertEqual(female.label, "FEMALE")
        female.tap()

        let slider = app.sliders["heightSlider"]
        XCTAssertTrue(slider.exists)

        let resultView = app.buttons["recalculateButton"]
        XCTAssertFalse(resultView.exists)
    }

    func testResultViewAppearance() throws {
        let calculateButton = app.buttons["calculateButton"]
        calculateButton.tap()

        let recalculateButton = app.buttons["recalculateButton"]
        XCTAssertTrue(recalculateButton.waitForExistence(timeout: 0.5))
    }

    func testResultView() throws {
        app.buttons["maleButton"].tap()
        app.sliders["heightSlider"].adjust(toNormalizedSliderPosition: 0.65)
        app.buttons["plusButton"].firstMatch.tap()
        app.buttons.matching(identifier: "plusButton").element(boundBy: 1).tap()
        app.buttons["calculateButton"].tap()
        
        let title = app.staticTexts["Your Result"]
        XCTAssertTrue(title.exists)

        let resultTitle = app.staticTexts["Normal"]
        XCTAssertTrue(resultTitle.exists)
        
        let bmiIndex = app.staticTexts["21,5"]
        XCTAssertTrue(bmiIndex.exists)

        let description = app.staticTexts["You have a normal body weight. Good job!"]
        XCTAssertTrue(description.exists)

        let recalculateButton = app.buttons["recalculateButton"]
        recalculateButton.tap()
        XCTAssertFalse(recalculateButton.waitForExistence(timeout: 0.5))
    }
}
