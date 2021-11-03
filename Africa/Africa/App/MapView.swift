//
//  MapView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        var coordinates = CLLocationCoordinate2D(latitude: 6.6, longitude: 16.4)
        var zoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        return MKCoordinateRegion(center: coordinates, span: zoomLevel)
    }()
    
    let locations: [LocationModel] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32, height: 32, alignment: .center)
            //            }
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding(),
            alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
