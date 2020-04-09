//
//  ContentView.swift
//  Accessibility
//
//  Created by Stefan Steinbauer on 09.04.20.
//  Copyright © 2020 Stefan Steinbauer. All rights reserved.
//

import SwiftUI
    struct ContentView: View {

        let pictures = [
            "ales-krivec-15949",
            "galina-n-189483",
            "kevin-horstmann-141705",
            "nicolas-tissot-335096"
        ]
        
        let labels = [
            "Tulips",
            "Frozen tree buds",
            "Sunflowers",
            "Fireworks",
        ]
        
        @State private var selectedPicture = Int.random(in: 0...3)
        
        var body: some View {
            VStack {
                Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .accessibility(label: Text(labels[selectedPicture]))
                .accessibility(addTraits: .isButton)
                .accessibility(removeTraits: .isImage)
                .onTapGesture {
                    self.selectedPicture = Int.random(in: 0...3)
            }
            
            
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement(children: .ignore)
            .accessibility(label: Text("Your score is 1000"))
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
