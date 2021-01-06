//
//  SwiftUIView.swift
//  
//
//  Created by Alessio Rubicini on 04/01/21.
//

import SwiftUI

public struct HealthGroupBox: View {
    
    let label: String
    let icon: String
    let color: Color
    let value: String
    let measure: String
    
    public var body: some View {
        GroupBox(label: Label(label, systemImage: icon).foregroundColor(color)) {
            HStack {
                Text(value).fontWeight(.bold).font(.title)
                Text(measure).fontWeight(.semibold).foregroundColor(.gray)
                Spacer()
            }
            .padding(.vertical, 5)
            
        }.cornerRadius(10)
        .padding(.horizontal)
    }
}


struct HealthGroupBox_Previews: PreviewProvider {
    static var previews: some View {
        HealthGroupBox(label: "Heartrate", icon: "heart.fill", color: .red, value: "32", measure: "bmp")
    }
}
