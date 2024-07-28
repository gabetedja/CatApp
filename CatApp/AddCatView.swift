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
import SwiftData



struct AddCatView: View {
    
    // Instance variables that are created each time the view is loaded
    @State var label: String = ""
    @State var breed: String = ""
    @State private var catItem: PhotosPickerItem?
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
                    
                    Text("Where did you see this cat? Every time you tap, ")
                        .padding(.bottom, 2)
                    Text("a new Cat entry will be created and stored.")
                        .padding(.bottom, 15)
                    
                    AddCatMapView(label: label, breed: breed)
            }
            .navigationBarHidden(true)
            // Ditching the idea of a title bar. keeping this here in case we want it back.
            //.navigationBarTitle("Add A Cat Sighting")
            //.navigationBarTitleDisplayMode(.inline) // do we want this?
            // next 2 lines took me way too long to find how to do holy shit. these control the toolbar's color
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(bgColor, for: .navigationBar)

        }
    }
}


// Form to handle user input, using binded variables to relay the change back to the parent view variables
    struct AddCatForm: View {
        
        // Binded instance variables passed in by parent view
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
}

// Handles map logic and returns the map as a view
struct AddCatMapView: View {
    
    // Instance variables passed in by parent view
    var label: String
    var breed: String
    
    // Used to get user's current position.. unsure what fallback does. Redraws the map every time user moves.
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    // Create a usable reference to the database.
    @Environment(\.modelContext) private var context
    
    // Querying the database happens through here (eg. for loop)
    @Query var cats: [Cat]
    
    // Add a state variable to listen for the new cat location, can be nil. Redraws the map every time this is updated.
    @State private var newCatLocation: CLLocationCoordinate2D?
    
    var body: some View {
        MapReader { proxy in
            Map(position: $cameraPosition) {
                UserAnnotation() // show user location blue dot
                
                // If the catlocation is NOT nil, add the marker.
                // Since catlocation is a state variable, Map will be redrawn every time it is updated
                // Gpt gave me the if condition, still a bit confused on how the code translates to english
                if let newCatLocation = newCatLocation {
                    Marker("", coordinate: newCatLocation)
                }
            }
            .onAppear {
                CLLocationManager().requestWhenInUseAuthorization() // ask for location permission
            }
            .onTapGesture { position in
                // If we can convert from the tapped pixel position to coordinates, store the data in coordinate variable and do the following
                if let coordinate = proxy.convert(position, from: .local) {
                    
                    // Create and add item to database
                    let catEntry = Cat(label: label, breed: breed, latitude: coordinate.latitude, longitude: coordinate.longitude)
                    context.insert(catEntry)
                    
                    // Update the coordinate state variable, which will redraw the Map with the marker
                    newCatLocation = coordinate
                    
                    // debug messages
                    print("added object")
                    for cat in cats {
                        print("\(cat.label) is \(cat.breed) breed. They were seen at (\(cat.latitude), \(cat.longitude))")
                    }
                }
            }
        }
    }
}

#Preview {
    AddCatView()
        .modelContainer(for: Cat.self)
}


