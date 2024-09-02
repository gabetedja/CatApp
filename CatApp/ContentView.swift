//
//  ContentView.swift
//  Test
//
//  Created by Gabriel Tedja on 7/23/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    
    
    var body: some View {
        
        
        NavigationView { // this must be the root container, otherwise bg doesn't work with navlinks.
            
            ZStack {
                
                Background()
                
                VStack { // all content goes inside here
                    
                    LogoAndHeader()
                        .padding([.bottom], 10)
                    
                    NavigationMenu()
                    
                }
                .padding([.bottom], 100) // content alignment
            }
        }
    }
}

// SUBVIEWS BELOW:

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

struct NavigationMenu: View {
    @Environment(\.modelContext) private var context
    var body: some View {
        HStack {
            NavigationLink(destination: AddCatView(), label: {
                NavLinkText(textString: "Add Cat")
            })
            NavigationLink(destination: MapView(), label: {
                NavLinkText(textString: "Map View")
            })
            NavigationLink(destination: CatDataView(), label: {
                NavLinkText(textString: "Cat List")
            })
            // delete this after, or at least rearrange it.
            Button("Button title") {
                do {
                    try context.delete(model: Cat.self)
                    print("deleted all cats")
                } catch {
                    print("Failed to delete cats.")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
