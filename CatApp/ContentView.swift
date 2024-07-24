//
//  ContentView.swift
//  Test
//
//  Created by Gabriel Tedja on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    
    // user input variables
    // i think these will need to be in their own views, not here - atharva

    
    var body: some View {
        NavigationView { // this must be the root element for some stupid reason, otherwise bg doesn't work with navlinks.
            
            ZStack { // so the background can be behind the content
                
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
    var body: some View {
        HStack {
            NavigationLink(destination: AddCatView(), label: {
                NavLinkText(textString: "Add Cat")
            })
            NavigationLink(destination: MapView(), label: {
                NavLinkText(textString: "Map View")
            })
            NavigationLink(destination: CatDataView(), label: {
                NavLinkText(textString: "Cat Data")
            })
        }
    }
}


#Preview {
    ContentView()
}
