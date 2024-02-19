//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Eduard on 22.11.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var calculator: Calculator

    var showingResults: Bool {
        calculator.bmiResult != nil
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    Text("BMI CALCULATOR")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Divider()
                        .frame(height: 6)
                        .background {
                            Color.black.opacity(0.4)
                        }

                    Grid(alignment: .center, horizontalSpacing: 24, verticalSpacing: 24) {
                        GridRow {
                            GenderView(type: .male, icon: "⚦", chosenGender: $calculator.gender)
                            GenderView(type: .female, icon: "♀", chosenGender: $calculator.gender)
                        }

                        GridRow {
                            HeightSliderView(value: $calculator.height)
                        }
                        .gridCellColumns(2)

                        GridRow {
                            MeasurementsView(title: "WEIGHT", value: $calculator.weight)
                            MeasurementsView(title: "AGE", value: $calculator.age)
                        }
                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 12)

                    BottomButton(title: "CALCULATE", action: calculator.calculateBMI)
                }
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.bottom)
                .background(
                    Color("primary")
                )
            }

            ResultsView()
                .offset(x: showingResults ? 0 : proxy.size.width)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Calculator())
    }
}
