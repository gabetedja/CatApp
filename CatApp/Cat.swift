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
   
    init(label: String = "", breed: String = "") {
       self.label = label
       self.breed = breed
   }
}
