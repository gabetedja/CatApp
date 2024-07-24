//
//  Background.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        let bgColor = Color(red: 0.6, green: 0.4, blue: 0.2, opacity: 0.4) // creating a custom light brown
        
        Color(bgColor) // create a new Color view that ignores all safe edges
            .edgesIgnoringSafeArea(.all)
    }
}


