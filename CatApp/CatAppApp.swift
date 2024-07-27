//
//  CatAppApp.swift
//  CatApp
//
//  Project by Gabriel Tedja and Atharva Nagtode
//

import SwiftData
import SwiftUI

@main
struct CatAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Cat.self) // creating a container that stores Cat objects
    }
}
