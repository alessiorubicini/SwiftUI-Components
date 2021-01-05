//
//  SwiftUIView.swift
//  
//
//  Created by Alessio Rubicini on 05/01/21.
//

import SwiftUI

public struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

struct NeumorphicButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.offWhite.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                print("Button tapped")
            }) {
                Image(systemName: "house.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 25))
            }
            .buttonStyle(NeumorphicButtonStyle())
        }
        
    }
}
