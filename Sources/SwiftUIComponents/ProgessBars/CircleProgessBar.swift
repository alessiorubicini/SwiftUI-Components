//
//  SwiftUIView.swift
//  
//
//  Created by Alessio Rubicini on 02/01/21.
//

import SwiftUI

public struct CircleProgressBar: View {
    
    @Binding var value: Double
    let label: String
    let width: Double
    let font: Font
    let color: Color

    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: CGFloat(width))
                .opacity(0.3)
                .foregroundColor(color)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(value, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(width), lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            Text(label)
                .foregroundColor(color)
                .font(font)
        }
    }
    

    
}

#if DEBUG
struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(value: .constant(0.3), label: "C", width: 25, font: .largeTitle, color: .orange)
            .padding(30)
    }
}
#endif
