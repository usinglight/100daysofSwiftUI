//
//  ContentView.swift
//  Instafilter
//
//  Created by Stefan Steinbauer on 02.04.20.
//  Copyright © 2020 Stefan Steinbauer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
    @State private var blurAmount: CGFloat = 0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
