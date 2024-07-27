//
//  MapView.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//

import SwiftUI
import MapKit //MapKit obviously necessary
import SwiftData

struct MapView: View {
    
    @Environment(\.modelContext) private var context // create usable reference to the modelcontext (database operations
    @Query var cats: [Cat] // needed for read operations
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Button(action: {
                    for cat in cats {
                        print("\(cat.label) is \(cat.breed) breed. They were seen at (\(cat.latitude),\(cat.longitude))")
                    }
                }) {
                    Text("TEST: Load cat data")
                }
            }
        }
    }
}

#Preview {
    MapView()
}
