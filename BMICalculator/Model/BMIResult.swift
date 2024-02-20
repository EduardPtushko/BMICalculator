//
//  BMIResult.swift
//  BMICalculator
//
//  Created by Eduard Ptushko on 19.02.2024.
//

import Foundation

enum BMIResult {
    case underweight(Double)
    case normal(Double)
    case overweight(Double)

    var title: String {
        switch self {
        case .underweight:
            "Underweight"
        case .normal:
            "Normal"
        case .overweight:
            "Overweight"
        }
    }

    var interpretation: String {
        switch self {
        case .underweight:
            return "You have a lower than normal body weight. You can eat a bit more."
        case .normal:
            return "You have a normal body weight. Good job!"
        case .overweight:
            return "You have a higher than normal body weight. Try to exercise more."
        }
    }

    var index: Double {
        switch self {
        case .underweight(let double):
            double
        case .normal(let double):
            double
        case .overweight(let double):
            double
        }
    }
}

extension BMIResult: Equatable {}
