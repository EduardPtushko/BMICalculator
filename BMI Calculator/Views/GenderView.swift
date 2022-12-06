//
//  Genger.swift
//  BMI Calculator
//
//  Created by Eduard on 25.11.2022.
//

import SwiftUI

struct GenderView: View {
    let type: Gender
    let icon: String
    @Binding var chosenGender: Gender?
    
    var isActive: Bool {
        if chosenGender == type {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack {
           Text(icon)
                .font(.system(size: 64))
                .foregroundColor(.white)
            
            Text(type.rawValue)
                .foregroundColor(Color("label-text-color"))
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(isActive ?  Color("active-card") : Color("inactive-card") )
        }
        .onTapGesture {
            chosenGender = isActive ? nil :  type
        }
    }
}

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView(type: .female, icon: "♀", chosenGender: .constant(.female))
    }
}
