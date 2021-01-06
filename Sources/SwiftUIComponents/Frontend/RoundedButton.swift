//
//  SwiftUIView.swift
//  
//
//  Created by Alessio Rubicini on 04/01/21.
//

import SwiftUI

public struct RoundedButton: View {
    
    let text: String
    let buttonColor: Color
    let textColor: Color
    let action: () -> Void

    public var body: some View {
        
        ZStack {
            Rectangle().fill(buttonColor).frame(height: 50).cornerRadius(10).padding()
            
            Text(text).foregroundColor(textColor).bold()
        }
        
        .onTapGesture {
            action()
        }
        
    }
}

#if DEBUG
struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(text: "Press here", buttonColor: .blue, textColor: .white, action: {})
    }
}
#endif
