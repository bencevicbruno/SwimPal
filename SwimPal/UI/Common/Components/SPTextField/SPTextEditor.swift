//
//  SPTextEditor.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct SPTextEditor: View {
    
    let title: String?
    let hint: String?
    
    @Binding var text: String
    
    @State private var isHintVisible: Bool
    
    init(title: String? = nil, hint: String? = nil, _ text: Binding<String>) {
        self.title = title
        self.hint = hint
        self._text = text
        self.isHintVisible = text.wrappedValue.isEmpty
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 5) {
                ZStack(alignment: .topLeading) {
                    ZStack(alignment: .bottom) {
                        RoundedCorner(radius: 10, corners: [.topLeft, .topRight])
                            .fill(Color.brand)
                        
                        RoundedCorner(radius: 10, corners: [.topLeft, .topRight])
                            .fill(.white)
                            .padding([.top, .horizontal], 2)
                            
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $text)
                                .disableAutocorrection(true)
                                .font(.roboto(.headline2))
                                .textFieldStyle(.plain)
                               
                            if let hint = hint {
                                Text(hint)
                                    .style(.roboto(.headline2))
                                    .padding(.top, 10)
                                    .padding(.leading, 5)
                                    .isVisible(text.isEmpty)
                            }
                        }
                        .frame(height: proxy.height - 10)
                        .background(Color.white)
                        .padding(.bottom, 4)
                        .background(Color.brand)
                        .padding(.horizontal, 10)
                    }
                    .frame(height: proxy.height)
                    .padding(.top, title == nil ? 0 : 12.5)
                    
                    if let title = title {
                        Text(title)
                            .style(.roboto(.body, .bold), .brand, .leading)
                        .padding(.horizontal, 5)
                        .background(Color.white)
                        .padding(.leading, 10)
                    }
                }
            }
        }
    }
}

struct SPTextEditor_Previews: PreviewProvider {
    
    static var previews: some View {
        var text = ""
        let binding = Binding<String>(get: { return text }, set: { newValue in text = newValue })
        
        Group {
            SPTextEditor(title: "Title", hint: "Hello", binding)
                .padding()
            
            SPTextEditor(title: nil, hint: "Hint", .constant(""))
                .padding()
            
            SPTextEditor(title: "hehe", hint: nil, .constant(""))
                .padding()
        }
    }
}
