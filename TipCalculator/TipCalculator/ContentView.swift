//
//  ContentView.swift
//  TipCalculator
//
//  Created by Manav on 01/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    let tipPercentages = [0,10,20,30,40]
    
    var checkAmount: Double  {
        let totalPerson = Double(numberOfPeople + 2)
        let tip = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0
        let tipValue = orderAmount / 100 * tip
        let totalAmount = orderAmount + tipValue
        let amountPerPerson = totalAmount / totalPerson
        
        return amountPerPerson
    }
    var body: some View {
        HStack {
            NavigationView {
                Form {
                    Section {
                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                        Picker("Number of People", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach(0..<tipPercentages.count){
                                Text("\(tipPercentages[$0])%")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }.textCase(nil)
                    
                    Section {
                        Text("$\(checkAmount)")
                    }
                }.navigationTitle("Calculate Tip")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
