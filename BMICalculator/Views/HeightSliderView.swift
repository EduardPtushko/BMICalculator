//
//  HeightSliderView.swift
//  BMI Calculator
//
//  Created by Eduard on 25.11.2022.
//

import SwiftUI

struct HeightSliderView: View {
    @Binding var value: Double
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Height")
                .textCase(.uppercase)
                .foregroundStyle(Theme.labelTextColor)
            
            Text("\(value, specifier: "%.0f")")
                .font(.system(size: 44))
                .fontWeight(.bold)
            + Text("cm")
            
            UISliderView(value: $value)
                .tint(Color(hue: 0.964, saturation: 0.664, brightness: 0.662))
                .accessibilityIdentifier("heightSlider")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.vertical, 16)
        .foregroundColor(.white)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Theme.activeCard)
        }
    }
}

#Preview {
    HeightSliderView(value: .constant(156))
}
