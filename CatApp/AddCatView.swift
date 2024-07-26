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
                    Form {
                        Section() {
                            TextField(text:$label) {
                                Text("Cat Label")
                            }
                            TextField(text:$breed) {
                                Text("Breed")
                            }
                            PhotosPicker("Upload image of cat", selection: $catItem, matching: .images)
                        }
                    }
                    .frame(height: 180)
                    .scrollContentBackground(.hidden) // hides the default form background
                    Text("Where did you see this cat?")
                        .padding(.bottom, 10)
                    Map()
                }
            }
            .navigationBarTitle("Add A Cat Sighting")
            //.navigationBarTitleDisplayMode(.inline) // makes header smaller? it still looks jank..
            
            // this took me way too long to find how to do holy shit.
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(bgColor, for: .navigationBar)
        }
    }
}

#Preview {
    AddCatView()
}


