//
//  SaveTrainingView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import SwiftUI
import MapKit

struct SaveTrainingView: View {
    
    @ObservedObject var viewModel: SaveTrainingViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                NavigationBar("Add Details", onXTapped: viewModel.xTapped)
                
                content
            }
            .padding(.bottom, BigBottomButton.totalHeight)
            
            BigBottomButton("Done", onTapped: viewModel.doneTapped)
                .addShadow()
        }
        .setupView()
        .onTapGesture {
            UIApplication.hideKeyboard()
        }
        .confirmationSheet($viewModel.confirmationData)
        .fieldInputSheet($viewModel.fieldInputData)
        .textInputSheet($viewModel.textInputData)
        .infoSheet($viewModel.infoData)
        .edgesIgnoringSafeArea(.bottom)
        .activityIndicator(viewModel.isActivityRunning)
    }
}

private extension SaveTrainingView {
    
    var content: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                nameField
                
                timeField
                
                locationField
                
                notesField
                
                Spacer(minLength: 0)
            }
            .padding(10)
        }
    }
    
    var nameField: some View {
        NamedContainer("Name", onEditTapped: viewModel.editNameTapped) {
            HStack(spacing: 0) {
                Text(viewModel.name)
                    .style(.roboto(.body, .regular), .black, .leading)
                
                Spacer(minLength: 0)
            }
            .frame(height: 40)
        }
    }
    
    var timeField: some View {
        NamedContainer("Time") {
            HStack(spacing: 0) {
                Text("01:05h")
                    .style(.roboto(.body), .gray, .leading)
                
                Spacer(minLength: 0)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    var locationField: some View {
        TrainingLocationCard(viewModel.location, onAddLocationTapped: viewModel.addLocationTapped)
    }
    
    var notesField: some View {
        TrainingNotesCard(viewModel.notes) {
            viewModel.addNotesTapped()
        }
    }
}

struct SaveTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        SaveTrainingView(viewModel: .init(activeTraining: ActiveTraining(category: .lifeguard, excercises: Training.Category.lifeguard.excercises)))
    }
}
