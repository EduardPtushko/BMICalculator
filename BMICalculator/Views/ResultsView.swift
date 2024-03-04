//
//  ResultsView.swift
//  BMI Calculator
//
//  Created by Eduard on 25.11.2022.
//

import SwiftUI

struct ResultsView: View {
    @Environment(Calculator.self) var calculator

    var title: String {
        calculator.bmiResult?.title ?? ""
    }

    var bmiIndex: Double {
        calculator.bmiResult?.index ?? 0.0
    }

    var interpretation: String {
        calculator.bmiResult?.interpretation ?? ""
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Result")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.leading)

            VStack {
                Spacer()
                Text(title)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Theme.resultTextColor)

                Spacer()

                Text("\(bmiIndex, specifier: "%.1f")")
                    .font(.system(size: 100))
                    .fontWeight(.semibold)

                Spacer()

                Text(interpretation)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Theme.activeCard)
            }
            .padding()

            BottomButton(title: "RE-CALCULATE") {
                calculator.bmiResult = nil
            }
            .accessibilityIdentifier("recalculateButton")
        }
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.bottom)
        .background(Theme.primary)
    }
}

#Preview {
    ResultsView()
        .environment(Calculator())
}
