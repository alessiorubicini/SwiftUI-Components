//
//  AppOnBoarding.swift
//  
//
//  Created by Alessio Rubicini on 05/01/21.
//

import SwiftUI

struct AppOnBoarding<Content: View>: View {
    
    let content: Content
    @State private var selectedPage = 0
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        TabView(selection: $selectedPage) {
            content
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#if DEBUG
struct AppOnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        AppOnBoarding() {
            Text("First OnBoarding page")
            Text("Second OnBoarding page")
            Text("Third OnBoarding page")
        }
    }
}
#endif
