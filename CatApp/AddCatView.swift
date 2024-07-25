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
        ZStack {
            Background()
            Form {
                TextField(text:$label) {
                    Text("Label/Name")
                }
                TextField(text:$breed) {
                    Text("Breed")
                }
                PhotosPicker("Upload image of cat", selection: $catItem, matching: .images)
                Map()
            }
            
            
        }
    }
}

#Preview {
    AddCatView()
}


