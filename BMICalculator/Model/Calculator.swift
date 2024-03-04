//
//  Calculator.swift
//  BMI Calculator
//
//  Created by Eduard on 30.11.2022.
//

import Foundation

@Observable
class Calculator {
    var weight: Int = 56
    var height: Double = 170
    var age: Int = 25
    var gender: Gender = .male
    var bmiResult: BMIResult?

    func calculateBMI() {
        let bmi = Double(weight) / pow(height / 100, 2)
        bmiResult = getResult(bmi)
    }

    private func getResult(_ bmi: Double) -> BMIResult {
        if bmi >= 25 {
            return .overweight(bmi)
        } else if bmi > 18.5 {
            return .normal(bmi)
        } else {
            return .underweight(bmi)
        }
    }
}

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
}
