//
//  Cat.swift
//  CatApp
//
//  Created by Gabriel Tedja on 7/26/24.
//

import Foundation
import SwiftData
import SwiftUI
import PhotosUI
import _PhotosUI_SwiftUI

@Model
class Cat {
   
    var label: String
    var breed: String
    
    var latitude: Double
    var longitude: Double
   
    init(label: String, breed: String, latitude: Double, longitude: Double) {
        
        self.label = label
        self.breed = breed
        
        self.latitude = latitude
        self.longitude = longitude
    }
}
