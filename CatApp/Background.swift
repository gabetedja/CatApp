//
//  Background.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//

import SwiftUI

// The background color itself as a global variable. This is different from the color as a view, particularly because it is needed as an argument to configure the navigation toolbar
let bgColor = Color(red: 0.6, green: 0.4, blue: 0.2, opacity: 0.4)

// The background color as a view, needed for background in zstacks
struct Background: View {
    var body: some View {
        Color(bgColor) 
            .edgesIgnoringSafeArea(.all)
    }
}


