//
//  Calculator.swift
//  BMI Calculator
//
//  Created by Eduard on 30.11.2022.
//

import Foundation

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
}

class Calculator: ObservableObject {
    @Published var weight: Int = 56
    @Published var height: Double = 150
    @Published var age: Int = 25
    @Published var gender: Gender? = nil
    @Published var bmi: Double = 0
    
    func calculateBMI() {
        bmi = Double(weight) / pow(height / 100, 2)
    }
    
    func getResult() -> String {
        if bmi >= 25 {
            return "Overweight"
        } else if bmi > 18.5 {
            return "Normal"
        } else {
            return "Underweight"
        }
    }
    
    func getInterpretation() -> String {
        if bmi >= 25 {
            return "You have a higher than normal body weight. Try to exercise more."
        } else if bmi >= 18.5 {
            return "You have a normal body weight. Good job!"
        } else {
            return "You have a lower than normal body weight. You can eat a bit more."
        }
    }
    
}
