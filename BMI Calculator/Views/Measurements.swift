//
//  Measurements.swift
//  BMI Calculator
//
//  Created by Eduard on 25.11.2022.
//

import SwiftUI

struct Measurements: View {
    let title: String
    @Binding  var value: Int
    
    var body: some View {
        VStack {
           Text(title)
                .foregroundColor(Color("label-text-color"))
            Text("\(value)")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)
            HStack {
                Button {
                    guard value >= 0  else {
                        return
                    }
                    value -= 1
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .symbolRenderingMode(.palette)
                        .font(.system(size: 44))
                        .foregroundStyle(.white, Color("icon-background"))
                }
                
                Button {
                    guard value < 120  else {
                        return
                    }
                    value += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .symbolRenderingMode(.palette)
                        .font(.system(size: 44))
                        .foregroundStyle(.white, Color("icon-background"))
                }
            }
            .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("active-card"))
        }
    }
}

struct Measurements_Previews: PreviewProvider {
    static var previews: some View {
        Measurements(title: "WEIGHT", value: .constant(24))
    }
}
