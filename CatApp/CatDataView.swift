//
//  CatDataView.swift
//  CatApp
//
//  Created by Atharva on 7/24/24.
//
import SwiftUI
import SwiftData
import PhotosUI

struct CatDataView: View {
    //reference to database
    @Environment(\.modelContext) private var context
    @Query var cats: [Cat] //ensures a loop iterates thru here
    
    
    
    
    var body: some View {
 
        List {
                ForEach(cats, id:\.self) { cat in
                    VStack {
                        HStack {
                            Text("Name")
                            Text("Breed")
                        }
                    }
                    HStack {
                        Text(cat.label)
                        Text(cat.breed)
                            .background(Rectangle().fill(Color.white).shadow(radius: 3))

                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("List of Cats")
        }
    }


#Preview {
    CatDataView()
        .modelContainer(for: Cat.self) //container that stores cat objects
}
