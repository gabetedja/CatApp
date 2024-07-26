//
//  AddCatView.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//

import SwiftUI
import PhotosUI //import necessary for photo uploads
import MapKit
import CoreLocation //necessary libraries later
import CoreLocationUI

struct AddCatView: View {
    @State var label: String = "" //you need to declare these variables in the struct
    @State var breed: String = ""
    @State private var catItem: PhotosPickerItem? //cat image stuff
    @State private var catImage: Image?
    
    var body: some View {
        NavigationView {
            ZStack { // root container
                Background()
                VStack (spacing: 0) { // all content goes inside here
                    
                    Text("Add A New Cat Sighting")
                        .padding(.bottom, -20) // jank padding hack, but i had no idea what was adding the weird space.
                    
                    AddCatForm(label: $label, breed: $breed, catItem: $catItem)
                        .frame(height: 195)
                        .scrollContentBackground(.hidden) // hides the default form background
                    
                    Text("Where did you see this cat?")
                        .padding(.bottom, 15)
                    
                    AddCatMapView()
                }

            }
            .navigationBarHidden(true)
            // ditching the idea of a title bar. too hard to make it not ugly. keeping this here in case we want it back.
            //.navigationBarTitle("Add A Cat Sighting")
            //.navigationBarTitleDisplayMode(.inline) // do we want this?
            
            // next 2 lines took me way too long to find how to do holy shit. these control the toolbar's color
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(bgColor, for: .navigationBar)

        }
    }
}



// Form to handle user input, used bindings to relay the change back to the parent view, and returns a form view
struct AddCatForm: View {
    
    // need to work out if this binding logic makes sense.. not sure fully
    @Binding var label: String
    @Binding var breed: String
    @Binding var catItem: PhotosPickerItem?
    
    var body: some View {
        Form {
            Section() {
                TextField(text: $label) {
                    Text("Cat Nickname")
                }
                TextField(text: $breed) {
                    Text("Breed")
                }
                PhotosPicker("Upload Cat Picture", selection: $catItem, matching: .images)
            }
        }
    }
}

// Handles map logic and returns the map as a view
struct AddCatMapView: View {
    
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic) // not sure exactly what .automatic does.. need to research
    
    var body: some View {
        
        Map(position: $cameraPosition) {
            UserAnnotation() // show user location blue dot
        }
        .mapControls {
            MapUserLocationButton() // add location centering (arrow) button
            MapPitchToggle() // 2d and 3d
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization() // ask for location permission
        }
        
        // MAP todo list:
        // initially, center map on user location <DONE>
        // allow user to tap on map and add marker
        // then, need to store that data in an object somewhere,
        // using swiftdata.
    }
}

#Preview {
    AddCatView()
}


