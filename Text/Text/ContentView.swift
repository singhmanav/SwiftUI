//
//  ContentView.swift
//  Text
//
//  Created by Manav on 01/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var isPersented = true
    var body: some View {
        Text("Hello, world!")
            .font(.footnote)
            .fontWeight(.regular)
            .padding()
            .alert(isPresented: $isPersented, content: {
                Alert(title: Text("Hii"), message: Text("Want Coffee?"), dismissButton: .destructive(Text("No Coffee")))
            })
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
