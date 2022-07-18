//
//  MapLocationPickerView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import SwiftUI
import MapKit

struct MapLocationPickerView: View {
    
    @ObservedObject var viewModel: MapLocationPickerViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar("Pick Location", onBackTapped: viewModel.dismiss, onXTapped: viewModel.exit)
            
            mapView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            BigBottomButton("Select", onTapped: viewModel.exit)
        }
        .edgesIgnoringSafeArea(.bottom)
        .removeNavigationBar()
    }
}

private extension MapLocationPickerView {
    
    var mapView: some View {
        Map(coordinateRegion: $viewModel.region, interactionModes: .all, showsUserLocation: true)
    }
}

struct MapLocationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MapLocationPickerView(viewModel: .init())
    }
}
