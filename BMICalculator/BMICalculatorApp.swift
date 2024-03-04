//
//  BMICalculatorApp.swift
//  BMI Calculator
//
//  Created by Eduard on 22.11.2022.
//

import SwiftUI

@main
struct BMICalculatorApp: App {
    var calculator = Calculator()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(calculator)
        }
    }
}
