//
//  MapView.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//

import SwiftUI
import MapKit
import SwiftData

struct MapView: View {
    
    @Environment(\.modelContext) private var context // create usable reference to the modelcontext (database operations
    @Query var cats: [Cat] // needed for read operations
    
    var body: some View {
        NavigationView {
            MapSection()
        }
    }
}

// Handles map logic and returns the map as a view
struct MapSection: View {
 
    // Used to get user's current position.. unsure what fallback does. Redraws the map every time user moves.
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    // Create a usable reference to the database.
    @Environment(\.modelContext) private var context
    
    // Querying the database happens through here (eg. for loop)
    @Query var cats: [Cat]
        
    var body: some View {
        Map(position: $cameraPosition) {
            UserAnnotation() // show user location blue dot
            ForEach(cats) { cat in
                Marker("\(cat.label)", coordinate: CLLocationCoordinate2D(latitude: cat.latitude, longitude: cat.longitude))
            }
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization() // ask for location permission
        }
    }
}

#Preview {
    MapView()
        .modelContainer(for: Cat.self)
}

