//
//  MainButton.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//

import SwiftUI

// Subview that is a TextView but looks like a button (used in navlinks)
struct NavLinkText: View {
    
    var textString: String
    
    var body: some View {
        Text(textString)
            .bold()
            .frame(width: 100, height: 30)
            .font(.system(size: 14))
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
}

