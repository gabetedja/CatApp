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
                    Text("List of Cats")
                        .padding(.bottom, 10)
                    ForEach(cats) { cat in
                        HStack {
                            VStack {
                                Text("\(cat.label)")
                                Map() {
                                    Marker("\(cat.label)", coordinate: CLLocationCoordinate2D(latitude: cat.latitude, longitude: cat.longitude))
                                }
                                .mapStyle(.hybrid(elevation: .realistic))
                                .frame(height: 170)
                            }
                            
                            VStack {
                                Text("\(cat.breed)")
                                if let imageData = cat.image, let uiImage = UIImage(data: imageData) {
                                    // make the following code a subview, since its duplicated in 2 places
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .frame(height: 170)
                                }
                                else {
                                    Image(.standingCat)
                                        .resizable()
                                        .frame(height: 170)
                                }
                            }
                        }
                        .padding([.bottom, .leading, .trailing], 10)
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
