//
//  ContentView.swift
//  Pokedex
//
//  Created by Jorge Plasencia on 01/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TeamBuilderView()
                .tabItem{ Text("Team Builder")}.tag(1)
            PokedexView()
                .tabItem{ Text("Pokedex")}.tag(2)
            ProfileView()
                .tabItem{ Text("Profile")}.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

