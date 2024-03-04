//
//  MeasurementsView.swift
//  BMI Calculator
//
//  Created by Eduard on 25.11.2022.
//

import SwiftUI

struct MeasurementsView: View {
    let title: String
    @Binding var value: Int

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(Theme.labelTextColor)

            Text("\(value)")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)

            HStack {
                Button {
                    guard value >= 0 else {
                        return
                    }
                    value -= 1
                } label: {
                    Symbols.minus
                        .symbolRenderingMode(.palette)
                        .font(.system(size: 44))
                        .foregroundStyle(.white, Theme.iconBackground)
                }
                .accessibilityIdentifier("minusButton")

                Button {
                    guard value < 120 else {
                        return
                    }
                    value += 1
                } label: {
                    Symbols.plus
                        .symbolRenderingMode(.palette)
                        .font(.system(size: 44))
                        .foregroundStyle(.white, Theme.iconBackground)
                }
                .accessibilityIdentifier("plusButton")
            }
            .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Theme.activeCard)
        }
    }
}

#Preview{
    MeasurementsView(title: "WEIGHT", value: .constant(24))
}
