//
//  HeightSlider.swift
//  BMI Calculator
//
//  Created by Eduard on 25.11.2022.
//

import SwiftUI

struct HeightSlider: View {
    @Binding var value: Double

    init(value: Binding<Double>) {
        _value = Binding(projectedValue: value)
        let config = UIImage.SymbolConfiguration(pointSize: 14)
        let thumbImage = UIImage(systemName: "circle.fill", withConfiguration: config)?.withTintColor(
            UIColor(named: "bottom-container") ?? .systemRed, renderingMode: .alwaysOriginal)
        UISlider.appearance().setThumbImage(thumbImage, for: .normal)
        UISlider.appearance().maximumTrackTintColor = UIColor(named: "label-text-color") ?? .systemRed
       }

    var body: some View {
        VStack(spacing: 0) {
           Text("HEIGHT")
                .foregroundColor(Color("label-text-color"))

            Text("\( value, specifier: "%.0f")")
                .font(.system(size: 44))
                .fontWeight(.bold)
            + Text("cm")

            Slider(value: $value, in: 30...230)
                .tint(Color(hue: 0.964, saturation: 0.664, brightness: 0.662))

        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.vertical, 16)
        .foregroundColor(.white)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("active-card"))
        }
    }
}

struct HeightSlider_Previews: PreviewProvider {
    static var previews: some View {
        HeightSlider(value: .constant(156))
    }
}
