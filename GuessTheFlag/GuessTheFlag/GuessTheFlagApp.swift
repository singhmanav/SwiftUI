//
//  GuessTheFlagApp.swift
//  GuessTheFlag
//
//  Created by Manav on 10/11/20.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    var body: some Scene {
        WindowGroup {
            let country: [Country] = Locale.isoRegionCodes.map({
                let name = Locale.current.localizedString(forRegionCode: $0) ?? ""
                return Country(name: name, iso: $0)
            }).filter { UIImage(named: $0.iso.lowercased()) != nil }
            ContentView(countryData: country)
        }
    }
}
