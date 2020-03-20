//
//  ContentView.swift
//  WeSplit
//
//  Created by Stefan Steinbauer on 19.03.20.
//  Copyright © 2020 Stefan Steinbauer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        // calc the total incl tips
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue

        return grandTotal
    }
    
    var totalPerPerson: Double {
        // calc the total per person
        let peopleCount = Double(numberOfPeople+2)
        let totalPerPerson = grandTotal / peopleCount

        return totalPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                    Section {
                        TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                        
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2 ..< 100) {
                                Text("\($0) people")
                            }
                        }
                        
                        
                    }
                
                Section (header: Text("How much tip do you want to give?")){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("$ \(grandTotal, specifier: "%.2f")")
                }
                
                Section (header: Text("Amount per person")){
                        Text("$ \(totalPerPerson, specifier: "%.2f")")
                            
                    }
            }
        .navigationBarTitle("WeSplit")
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
