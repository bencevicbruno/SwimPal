//
//  EditTrainingView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI

struct EditTrainingView: View {
    
    @ObservedObject var viewModel: EditTrainingViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                NavigationBar("Edit Training", onBackTapped: viewModel.backTapped)
                
                ScrollView(.vertical) {
                    content
                        .padding(10)
                }
                .frame(maxHeight: .infinity)
            }
            .padding(.bottom, BigBottomButton.totalHeight)
            
            BigBottomButton("Save", isEnabled: viewModel.isFormValid, onTapped: viewModel.saveTapped)
        }
        .setupView()
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture {
            UIApplication.hideKeyboard()
        }
        .textInputSheet($viewModel.textInputData)
    }
}

private extension EditTrainingView {
    
    var content: some View {
        LazyVStack(spacing: 20) {
            SPTextField(title: "Name", hint: "", $viewModel.name, validators: [TextFieldValidator.nonEmpty])
            
            TrainingLocationCard(viewModel.location, onAddLocationTapped: viewModel.addLocationTapped)
            
            TrainingNotesCard(viewModel.notes, viewModel.addNotesTapped)
        }
    }
    
}

struct EditTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        EditTrainingView(viewModel: .init(model: EditTrainingModel(name: "Training Example")))
    }
}
