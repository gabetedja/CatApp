//
//  ContentView.swift
//  Test
//
//  Created by Gabriel Tedja on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    
    //user input variables
    @State var label: String = ""
    @State var breed: String = ""
    
    var body: some View {
        VStack { //VERTICAL AXIS
            Image(systemName: "cat")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Cat Spotter")
        }
        .padding()
        HStack { //HORIZONTAL AXIS
            Button("Add new cat") {
                
            }
            .buttonStyle(.borderedProminent)
            Button("Map View") {
                
            }
            .buttonStyle(.borderedProminent)
            Button("User Data") {
                
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
