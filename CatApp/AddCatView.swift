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
                    Form {
                        Section() {
                            TextField(text:$label) {
                                Text("Cat Nickname")
                            }
                            TextField(text:$breed) {
                                Text("Breed")
                            }
                            PhotosPicker("Upload Cat Image", selection: $catItem, matching: .images)
                        }
                    }
                    .frame(height: 195)
                    .scrollContentBackground(.hidden) // hides the default form background
                    Text("Where did you see this cat?")
                        .padding(.bottom, 10)
                    Map()
                }
            }
            .navigationBarHidden(true)
            // ditching the idea of a title bar. too hard to make it not ugly. keeping this here in case we want it back.
            //.navigationBarTitle("Add A Cat Sighting")
            //.navigationBarTitleDisplayMode(.inline) // do we want this?
            
            // next 2 lines took me way too long to find how to do holy shit. controls back section's color
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(bgColor, for: .navigationBar)

        }
    }
}

#Preview {
    AddCatView()
}


