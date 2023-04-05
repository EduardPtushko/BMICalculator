//
//  Results.swift
//  BMI Calculator
//
//  Created by Eduard on 25.11.2022.
//

import SwiftUI

struct Results: View {
    @Binding var isResults: Bool
    @EnvironmentObject var calculator: Calculator

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Your Result")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.leading)
                VStack {
                    Spacer()
                    Text(calculator.getResult())
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color("result-text-color"))

                    Spacer()
                    Text("\(calculator.bmi, specifier: "%.1f")")
                        .font(.system(size: 100))
                        .fontWeight(.semibold)

                    Spacer()

                    Text(calculator.getInterpretation())
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Spacer()
                    HStack {
                        Spacer()
                    }
                }
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("active-card"))
                }
                .padding()

                BottomButton(isResults: $isResults, title: "RE-CALCULATE")
            }
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.bottom)
            .background(Color("primary"))
        }
    }
}
struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results(isResults: .constant(true))
            .environmentObject(Calculator())
    }
}
