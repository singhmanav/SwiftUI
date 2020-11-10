//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manav on 10/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var countryData = [Country]()
    
    @State private var correctAnswer = Int.random(in: 0...3)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the Flag")
                        .foregroundColor(.white)
                        .font(.title3)
                    Text(countryData[correctAnswer].name)
                        .foregroundColor(.white)
                }
                
                ForEach(0..<4) { number in
                    Button(action: {
                        flagTapped(number)
                    }, label: {
                        countryData[number].flag
                            .resizable()
                            .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5)
                    })
                    
                }
            }.alert(isPresented: $showingScore, content: {
                Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue"), action: {
                    askQuestion()
                }))
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        showingScore = true
    }
    
    func askQuestion() {
        countryData.shuffle()
        correctAnswer = Int.random(in: 0...3)
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
        return Image(iso.lowercased())
    }
}
