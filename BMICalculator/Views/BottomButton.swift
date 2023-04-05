//
//  BottomButton.swift
//  BMI Calculator
//
//  Created by Eduard on 30.11.2022.
//

import SwiftUI

struct BottomButton: View {
    @Binding var isResults: Bool
    var action: (() -> Void)?
    let title: String

    var body: some View {
        Button {
            withAnimation {
                action?()
                isResults.toggle()
            }
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.bottom, 24)
                .foregroundColor(.white)
                .background {
                    Color("bottom-container")
                }
                .frame(height: 80)
        }
    }
}

struct BottomButton_Previews: PreviewProvider {
    static var previews: some View {
        BottomButton(isResults: .constant(true), action: {}, title: "CALCULATE")
    }
}
