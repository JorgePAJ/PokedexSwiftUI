//
//  PokedexView.swift
//  Pokedex
//
//  Created by Jorge Plasencia on 01/12/21.
//

import SwiftUI

struct PokedexView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Pokedex View")
                NavigationLink(destination: PokemonView()) {
                    Text("pokemon test")
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
