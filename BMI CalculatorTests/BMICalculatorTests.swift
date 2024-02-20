//
//  BMICalculatorTests.swift
//  BMI CalculatorTests
//
//  Created by Eduard on 22.11.2022.
//

@testable import BMICalculator
import XCTest

final class BMICalculatorTests: XCTestCase {
    var sut: Calculator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Calculator()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testCalculatorCalculateBMIShouldBeOverweight() {
        sut.weight = 80
        sut.height = 170
        let index = Double(sut.weight) / pow(sut.height / 100, 2)

        sut.calculateBMI()

        XCTAssertEqual(sut.bmiResult?.title, "Overweight")
        XCTAssertEqual(sut.bmiResult?.index, index)
        XCTAssertEqual(sut.bmiResult?.interpretation, BMIResult.overweight(index).interpretation)
    }

    func testCalculatorCalculateBMIShouldBeNormal() {
        sut.weight = 70
        sut.height = 180
        let index = Double(sut.weight) / pow(sut.height / 100, 2)

        sut.calculateBMI()

        XCTAssertEqual(sut.bmiResult?.title, "Normal")
        XCTAssertEqual(sut.bmiResult?.index, index)
        XCTAssertEqual(sut.bmiResult?.interpretation, BMIResult.normal(index).interpretation)
    }

    func testCalculatorCalculateBMIShouldBeUnderweight() {
        sut.weight = 45
        sut.height = 160
        let index = Double(sut.weight) / pow(sut.height / 100, 2)

        sut.calculateBMI()

        XCTAssertEqual(sut.bmiResult?.title, "Underweight")
        XCTAssertEqual(sut.bmiResult?.index, index)
        XCTAssertEqual(sut.bmiResult?.interpretation, BMIResult.underweight(index).interpretation)
    }
}
