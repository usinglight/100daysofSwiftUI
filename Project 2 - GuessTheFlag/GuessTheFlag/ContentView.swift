//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Stefan Steinbauer on 20.03.20.
//  Copyright © 2020 Stefan Steinbauer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var gameScore : Int = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        
        //        Button("Show Alert") {
        //            self.showingAlert = true
        //        }
        //        .alert(isPresented: $showingAlert) {
        //            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        //        }
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30){
                VStack{
                    Text("Tap the flag of")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                    .foregroundColor(.white)
                }.frame(width: 800)
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                Spacer()
                
            }
            .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(gameScore)"), dismissButton: .default(Text("Continue")) {self.askQuestion()})}
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            gameScore = gameScore + 10
        } else {
            scoreTitle = "Wrong"
            gameScore = gameScore - 5
        }
        
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
