//
//  BMI_CalculatorApp.swift
//  BMI Calculator
//
//  Created by Eduard on 22.11.2022.
//

import SwiftUI

@main
struct BMI_CalculatorApp: App {
   @StateObject var calculator = Calculator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(calculator)
        }
    }
}
