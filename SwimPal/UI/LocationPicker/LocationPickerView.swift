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
            
            ScrollView(.vertical) {
                content
                    .padding([.top, .horizontal], 10)
                    .padding(.bottom, UIScreen.bottomUnsafePadding)
            }
        }
        .setupView()
        .edgesIgnoringSafeArea(.bottom)
        .contentShape(Rectangle())
        .onTapGesture {
            UIApplication.hideKeyboard()
        }
    }
}

private extension LocationPickerView {
    
    var content: some View {
        VStack(spacing: 15) {
            SPTextField(title: "Location", hint: "Tap to search", $viewModel.searchText, showClearButton: true)
                .padding(.bottom, 10)
            
            resultTable
            
            Spacer(minLength: 0)
            
            searchOnMapButton
                .addShadow(.small)
        }
    }
    
    var resultTable: some View {
        LazyVStack(spacing: 5) {
            if viewModel.isActivityRunning {
                loadingIndicatorCell
            }
            
            if !viewModel.searchText.isEmpty && !viewModel.isActivityRunning {
                emptyContentView
                    .frame(maxHeight: .infinity)
            }
            
            ForEach(viewModel.results, id: \.self) { result in
                LocationCell(result) {
                    viewModel.resultTapped(result)
                }
            }
        }
        .clipShape(.roundedRectangle(15))
    }
    
    var loadingIndicatorCell: some View {
        Rectangle()
            .fill(Color.gray242)
            .frame(maxWidth: .infinity, height: 50)
            .overlay(
                ActivityIndicator(size: 20)
            )
    }
    
    var emptyContentView: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image("illustration_noInternet")
                .resizable()
                .scaledToFit()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: UIScreen.width * 0.75)
            
            Text("No results found.")
                .style(.roboto(.headline2, .bold), .brand, .center)
            
            Spacer()
        }
    }
    
    var searchOnMapButton: some View {
        Text("Search on Map")
            .style(.roboto(.body, .bold), .brand, .center)
            .frame(maxWidth: .infinity, height: 60)
            .background(Color.gray242)
            .clipShape(.roundedRectangle(10))
            .contentShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                viewModel.searchOnMapTapped()
            }
    }
}

struct LocationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerView(viewModel: .init())
    }
}
