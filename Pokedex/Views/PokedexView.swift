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
            Grid()
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
