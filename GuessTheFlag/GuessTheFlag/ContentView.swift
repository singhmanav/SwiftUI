//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manav on 10/11/20.
//

import SwiftUI

struct ContentView: View {
    var countryData = [Country]().shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...3)
    @State private var showingScore = false
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the Flag")
                        .foregroundColor(.white)
                    Text(countryData[correctAnswer].name)
                        .foregroundColor(.white)
                }
                
                ForEach(0..<4) { number in
                    Button(action: {
                        
                    }, label: {
                        countryData[correctAnswer].flag
                    })
                    
                }
                Spacer()
            }
        }
    }
    
    init() {
        load()
    }
    
    mutating func load() {
        countryData = Locale.isoRegionCodes.map({
            let name = Locale.current.localizedString(forRegionCode: $0) ?? ""
            return Country(name: name, iso: $0)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

public struct Country {
    public let name : String
    public let iso : String
    public var flag: Image {
        return Image(iso)
    }
}
