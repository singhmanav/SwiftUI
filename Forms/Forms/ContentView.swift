//
//  ContentView.swift
//  Forms
//
//  Created by Manav on 01/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Group {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                        .padding()
                    Text("Hello, world!")
                        .padding()
                    Text("Hello, world!")
                        .padding()
                    Text("Hello, world!")
                        .padding()
                    Text("Hello, world!")
                        .padding()
                }
                
    //            Text("Hello, world!") // Only 10 elements are allowed
    //                .padding()
            }.navigationBarTitle("Hello")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
