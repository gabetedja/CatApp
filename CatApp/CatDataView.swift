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
    // Add a state variable for cat location
    @State private var newCatLocation: CLLocationCoordinate2D?

    
    var body: some View {
        List {
            VStack {
                HStack {
                    Text("Name")
                    Text("Breed")
                }
            }
            ForEach(cats) { cat in
                VStack {
                    HStack {
                        Text(cat.label)
                        Text(cat.breed)
                           
                    }
                    Map() {
                        Marker("\(cat.label)", coordinate: CLLocationCoordinate2D(latitude: cat.latitude, longitude: cat.longitude))
                    }
                    .frame(height: 195)
                    .scrollContentBackground(.hidden) // hides the default form background
                }
            }
            .navigationTitle("List of Cats")
        }
    }
}


#Preview {
    CatDataView()
        .modelContainer(for: Cat.self) //container that stores cat objects
}
