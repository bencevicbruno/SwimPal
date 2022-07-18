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
        ZStack {
            VStack(spacing: 0) {
                NavigationBar("Add Details", onXTapped: viewModel.showDiscardTrainingConfirmation)
                
                Spacer()
                
                BigBottomButton("Done", onTapped: viewModel.done)
            }
            
            content
                .padding(.top, NavigationBar.height)
                .padding(.bottom, BigBottomButton.height)
        }
        .removeNavigationBar()
        .confirmationSheet($viewModel.confirmationData)
        .edgesIgnoringSafeArea(.bottom)
    }
}

private extension SaveTrainingView {
    
    var content: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                nameField
                
                timeField
                
                locationField
            }
            .padding(.horizontal, 10)
        }
    }
    
    var nameField: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.brand, lineWidth: 2)
                    .frame(height: 60)
                    .padding(.vertical, 10)
                
                Text("Name")
                    .style(.roboto(.caption, .medium), .brand)
                    .padding(.horizontal, 5)
                    .background(.white)
                    .padding(.leading, 20)
            }
            
            TextField("Insert name here", text: .constant(""))
                .frame(height: 60)
                .padding(.leading, 20)
        }
        .padding(.horizontal, 5)
    }
    
    var timeField: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.brand, lineWidth: 2)
                    .frame(height: 60)
                    .padding(.vertical, 10)
                
                Text("Time")
                    .style(.roboto(.caption, .medium), .brand)
                    .padding(.horizontal, 5)
                    .background(.white)
                    .padding(.leading, 20)
            }
            
            HStack(spacing: 0) {
                Text("01:05h")
                    .style(.roboto(.body), .black, .leading)
                    .padding(.leading, 20)
                
                Spacer(minLength: 0)
                    .padding(.trailing, 15)
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 5)
    }
    
    @ViewBuilder
    var locationField: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.brand, lineWidth: 2)
                    .padding(.vertical, 10)
                
                Text("Location")
                    .style(.roboto(.caption, .medium), .brand)
                    .padding(.horizontal, 5)
                    .background(.white)
                    .padding(.leading, 20)
            }
            
            if viewModel.location != nil {
                mapView
            } else {
                Text("Tap to enter location")
                    .style(.roboto(.body, .bold), .brand, .center)
                    .padding(.vertical, 50)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.goToLocationPicker()
                    }
            }
        }
        .padding(.horizontal, 5)
    }
    
    var mapView: some View {
        VStack(spacing: 10) {
            HStack(spacing: 0) {
                Text(viewModel.location?.name ?? "")
                    .style(.roboto(.body), .black, .leading)
                
                Spacer(minLength: 0)
            }
            
            if let latitude = viewModel.location?.latitude,
               let longitude = viewModel.location?.longitude {
                Map(coordinateRegion: .constant(.init(center: .init(latitude: latitude, longitude: longitude), span: .init())))
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom, 5)
            }
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
    }
}

struct SaveTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        SaveTrainingView(viewModel: .init(activeTraining: ActiveTraining(category: .lifeguard, excercises: Training.Category.lifeguard.excercises)))
    }
}
