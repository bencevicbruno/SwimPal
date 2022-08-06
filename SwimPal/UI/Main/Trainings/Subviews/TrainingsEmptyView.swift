//
//  TrainingsEmptyView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.07.2022..
//

import SwiftUI

struct TrainingsEmptyView: View {
    
    private let onStartTrainingTapped: EmptyCallback?
    
    init(onStartTrainingTapped: EmptyCallback? = nil) {
        self.onStartTrainingTapped = onStartTrainingTapped
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            Image("illustration_noTrainings")
                .resizable()
                .scaledToFit()
            
            Text("You gotta start swimming man")
                .style(.roboto(.headline1, .bold), .brand, .center)
            
            Text("Once you finish a training, it will show up right here.")
                .style(.roboto(.body), .black, .center)
            
            Spacer()
            
            startTrainingButton
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.bottom, MainTabBar.height + UIScreen.bottomUnsafePadding)
    }
}

private extension TrainingsEmptyView {
    
    var startTrainingButton: some View {
        Text("Start Training")
            .style(.roboto(.headline1, .bold), .white)
            .frame(maxWidth: .infinity, height: 60)
            .background(Color.brand)
            .clipShape(.roundedRectangle(15))
            .contentShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                onStartTrainingTapped?()
            }
    }
}

struct TrainingsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsEmptyView()
    }
}
