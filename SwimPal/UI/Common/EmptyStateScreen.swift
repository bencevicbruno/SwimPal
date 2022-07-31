//
//  EmptyStateScreen.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

struct EmptyStateData {
    let title: String
    let message: String
    let illustrationName: String
    let actionTitle: String?
    let action: EmptyCallback?
    
    init(title: String, message: String, illustrationName: String, actionTitle: String? = nil, action: EmptyCallback? = nil) {
        self.title = title
        self.message = message
        self.illustrationName = illustrationName
        self.actionTitle = actionTitle
        self.action = action
    }
}

struct EmptyStateScreen: View {
    
    private let data: EmptyStateData
    
    init(_ data: EmptyStateData) {
        self.data = data
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 10)
            
            Image(data.illustrationName)
            
            Text(verbatim: data.title)
                .style(.roboto(.headline1, .bold), .brand)
                .padding(.vertical, 24)
            
            Text(verbatim: data.message)
                .style(.roboto(.body, .medium))
            
            Spacer(minLength: 10)
            
            if data.actionTitle != nil {
                actionButton
                    .padding(.bottom, 10)
            }
        }
        .background(Color.white)
    }
}

private extension EmptyStateScreen {
    
    var actionButton: some View {
        Text((data.actionTitle ?? "").uppercased())
            .style(.roboto(.headline1, .bold), .white)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.brand)
            )
            .onTapGesture {
                data.action?()
            }
    }
}

struct EmptyStateScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateScreen(.init(title: "YEs?", message: "yes", illustrationName: "illustration_noStatistics"))
        
        EmptyStateScreen(.init(title: "YEs?", message: "yes", illustrationName: "illustration_noStatistics", actionTitle: "Lets gooo"))
    }
}
