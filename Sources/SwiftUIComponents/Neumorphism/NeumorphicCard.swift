//
//  SwiftUIView.swift
//  
//
//  Created by Alessio Rubicini on 05/01/21.
//

import SwiftUI

struct NeumorphicCard: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.offWhite)
            .frame(width: width, height: height)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

#if DEBUG
struct NeumorphicCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.offWhite.edgesIgnoringSafeArea(.all)
            
            NeumorphicCard(width: 300, height: 300)
        }
    }
}
#endif
