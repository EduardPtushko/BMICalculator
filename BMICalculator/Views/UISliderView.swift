//
//  UISliderView.swift
//  BMICalculator
//
//  Created by Eduard Ptushko on 19.02.2024.
//

import SwiftUI
import UIKit

struct UISliderView: UIViewRepresentable {
    @Binding var value: Double

    var minValue = 20.0
    var maxValue = 240.0
    var thumbColor = UIColor(named: "bottom-container") ?? .systemRed
    var minTrackColor = UIColor(named: "label-text-color") ?? .systemRed
    var maxTrackColor: UIColor = .lightGray

    class Coordinator: NSObject {
        var value: Binding<Double>

        init(value: Binding<Double>) {
            self.value = value
        }

        @objc func valueChanged(_ sender: UISlider) {
            value.wrappedValue = Double(sender.value)
        }
    }

    func makeCoordinator() -> UISliderView.Coordinator {
        Coordinator(value: $value)
    }

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = thumbColor
        slider.minimumTrackTintColor = minTrackColor
        slider.maximumTrackTintColor = maxTrackColor
        slider.minimumValue = Float(minValue)
        slider.maximumValue = Float(maxValue)
        slider.value = Float(value)

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )

        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
}

#Preview(body: {
    @State var height: Double = 150
    
    return UISliderView(value: $height)
})
