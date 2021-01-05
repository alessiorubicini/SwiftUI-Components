//
//  SwiftUIView.swift
//  
//
//  Created by Alessio Rubicini on 04/01/21.
//

import SwiftUI

public struct SearchBar: View {
    
    @Binding var text: String
    let type: SearchBarType
    let placeHolder: String
    
    public var body: some View {
        if type == .defaultStyle {
            DefaultSearchBar(text: $text, placeHolder: placeHolder)
        } else {
            WidgetStyleBar(text: $text, placeHolder: placeHolder)
        }
    }
}

struct DefaultSearchBar: View {
    
    @Binding var text: String
    let placeHolder: String
    @State private var isEditing = false
    
    public var body: some View {
        HStack {
            
            TextField(placeHolder, text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct WidgetStyleBar: View {
    
    @Binding var text: String
    let placeHolder: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            
            ZStack {
                TextField("", text: $text)
                    .frame(height: 50)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        withAnimation {
                            self.isEditing = true
                        }
                    }
                
                if text.count == 0 {
                    
                    Label {
                        Text(placeHolder).foregroundColor(Color(UIColor.systemGray3))
                    } icon: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }.font(.title3)
                    
                    
                    
                }
                
            }
            
            if isEditing {
                Button(action: {
                    withAnimation {
                        self.isEditing = false
                        self.text = ""
                        
                        // Dismiss the keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                    
                    
                    
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

public enum SearchBarType {
    /// Classic iOS search bar
    case defaultStyle
    
    /// Like search bar displayed in iOS 14 widget screen
    case widgetLike
}

#if DEBUG
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBar(text: .constant(""), type: .defaultStyle, placeHolder: "Search...")
                .padding()
            SearchBar(text: .constant(""), type: .widgetLike, placeHolder: "Search...")
                .padding()
        }.previewLayout(.sizeThatFits)
    }
}
#endif
