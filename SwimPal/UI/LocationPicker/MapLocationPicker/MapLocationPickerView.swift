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
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                NavigationBar(Localizable.pick_location, onBackTapped: viewModel.dismiss, onXTapped: viewModel.dismissAll)
                
                ZStack {
                    mapView
                    
                    Image("icon_location")
                        .frameForIcon()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.bottom, BigBottomButton.totalHeight)
            
            BigBottomButton(Localizable.select, onTapped: viewModel.selectTapped)
                .addShadow()
        }
        .setupView()
        .edgesIgnoringSafeArea(.bottom)
        .fieldInputSheet($viewModel.fieldInputData)
    }
}

private extension MapLocationPickerView {
    
    var mapView: some View {
        Map(coordinateRegion: $viewModel.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .none)
    }
}

struct MapLocationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceContainer.register(type: LocationService.self, LocationService())
        
        return MapLocationPickerView(viewModel: .init())
    }
}
