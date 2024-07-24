//
//  ContentView.swift
//  Test
//
//  Created by Gabriel Tedja on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    
    //user input variables
    // i think these will need to be in their own views, not here - atharva
    @State var label: String = ""
    @State var breed: String = ""
    
    var body: some View {
        ZStack { // root zstack - contains bg and root vstack
            
            Background()
            
            VStack { // root vstack - all content goes inside here
                
                LogoAndHeader()
                    .padding([.bottom], 10)
                
                HStack {
                    CommonButton(buttonText: "Add New Cat")
                    CommonButton(buttonText: "Map View")
                    CommonButton(buttonText: "Cat Data")
                }
            }
            .padding([.bottom], 80) // moving all content up
        }
    }
}

// Helper view specific to this view
struct LogoAndHeader: View {
    var body: some View {
        VStack {
            Image(.standingCat)
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("Cat Spotter")
                .foregroundColor(.black)
                .font(.system(size: 30))
        }
    }
}

#Preview {
    ContentView()
}
