//
//  MainButton.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//

import SwiftUI

// Helper view that's probably going to be used in multiple other views
struct CommonButton: View {
    var buttonText: String
    var body: some View {
        Button(buttonText) {
        }
        .buttonStyle(.borderedProminent)
    }
}

