//
//  LocationPickerView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import SwiftUI

struct LocationPickerView: View {
    
    @ObservedObject var viewModel: LocationPickerViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar("Pick Location", onXTapped: viewModel.dismiss)
            
            searchBar
                .padding(10)
            
            Text("Open map")
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.goToMapLocationPicker()
                }
            
            content
        }
        .setupView()
        .edgesIgnoringSafeArea(.bottom)
    }
}

private extension LocationPickerView {
    
    var searchBar: some View {
        HStack(spacing: 10) {
            TextField("Location", text: .constant(""))
                .frame(height: 40)
               
            Text("Clear")
                .style(.roboto(.smallCaption, .light), .brand, .center)
                .frame(height: 40)
                .frame(minWidth: 40)
//            Image(systemName: "multiply")
//                .frameForIcon()
//                .onTapGesture {
//                    print("yes")
//                }
        }
        .padding(5, .standard)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.brand, lineWidth: 2)
        )
    }
    
    @ViewBuilder
    var content: some View {
        if viewModel.isActivityRunning {
            
        } else if let errorData = viewModel.error {
            Text(errorData.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            if let results = viewModel.results {
                if results.isEmpty {
                    Text("Nothing found")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text("content goes here")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else {
                Text("find location")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct LocationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerView(viewModel: .init())
    }
}
