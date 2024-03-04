//
//  BMICalculatorTests.swift
//  BMI CalculatorTests
//
//  Created by Eduard on 22.11.2022.
//

@testable import BMICalculator
import XCTest

final class BMICalculatorTests: XCTestCase {
    var calculator: Calculator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
        try super.tearDownWithError()
    }

    func testCalculatorCalculateBMIShouldBeOverweight() {
        calculator.weight = 80
        calculator.height = 170
        let index = Double(calculator.weight) / pow(calculator.height / 100, 2)

        calculator.calculateBMI()

        XCTAssertEqual(calculator.bmiResult?.title, "Overweight")
        XCTAssertEqual(calculator.bmiResult?.index, index)
        XCTAssertEqual(calculator.bmiResult?.interpretation, BMIResult.overweight(index).interpretation)
    }

    func testCalculatorCalculateBMIShouldBeNormal() {
        calculator.weight = 70
        calculator.height = 180
        let index = Double(calculator.weight) / pow(calculator.height / 100, 2)

        calculator.calculateBMI()

        XCTAssertEqual(calculator.bmiResult?.title, "Normal")
        XCTAssertEqual(calculator.bmiResult?.index, index)
        XCTAssertEqual(calculator.bmiResult?.interpretation, BMIResult.normal(index).interpretation)
    }

    func testCalculatorCalculateBMIShouldBeUnderweight() {
        calculator.weight = 45
        calculator.height = 160
        let index = Double(calculator.weight) / pow(calculator.height / 100, 2)

        calculator.calculateBMI()

        XCTAssertEqual(calculator.bmiResult?.title, "Underweight")
        XCTAssertEqual(calculator.bmiResult?.index, index)
        XCTAssertEqual(calculator.bmiResult?.interpretation, BMIResult.underweight(index).interpretation)
    }
}
