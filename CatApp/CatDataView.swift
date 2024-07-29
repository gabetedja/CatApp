//
//  CatDataView.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//
import SwiftUI
import SwiftData
import PhotosUI
import MapKit
import CoreLocation
import CoreLocationUI

struct CatDataView: View {
    
    //reference to database
    @Environment(\.modelContext) private var context
    
    @Query var cats: [Cat] //ensures a loop iterates thru here


    var body: some View {
        NavigationView {
            ZStack {
                Background()
                ScrollView {
                    ForEach(cats) { cat in
                        VStack {
                            Text("\(cat.label), who is a(n) \(cat.breed)")
                            
                            // image goes here
                            
                            Map() {
                                Marker("\(cat.label)", coordinate: CLLocationCoordinate2D(latitude: cat.latitude, longitude: cat.longitude))
                            }
                            .mapStyle(.hybrid(elevation: .realistic))
                            .mapControls {
                                MapCompass()
                                MapPitchToggle()
                            }
                            .frame(height: 300)
                        }
                        .padding([.bottom, .leading, .trailing], 20)
                    }
                }
                .navigationBarHidden(true)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(bgColor, for: .navigationBar)
            }
        }
    }
}


#Preview {
    CatDataView()
        .modelContainer(for: Cat.self) //container that stores cat objects
}
