//
//  BottomButton.swift
//  BMI Calculator
//
//  Created by Eduard on 30.11.2022.
//

import SwiftUI

struct BottomButton: View {
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
                .padding(.bottom)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 80)
                .foregroundColor(.white)
                .background {
                    Theme.bottomContainer
                }
        }
    }
}

#Preview {
    BottomButton(title: "CALCULATE", action: {})
}
