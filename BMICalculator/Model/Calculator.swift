//
//  Calculator.swift
//  BMI Calculator
//
//  Created by Eduard on 30.11.2022.
//

import Foundation

class Calculator: ObservableObject {
    @Published var weight: Int = 56
    @Published var height: Double = 240
    @Published var age: Int = 25
    @Published var gender: Gender = .male
    @Published var bmiResult: BMIResult?

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
