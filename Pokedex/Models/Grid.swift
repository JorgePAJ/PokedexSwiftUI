//
//  Grid.swift
//  Pokedex
//
//  Created by Diego Mojarro on 07/12/21.
//

import SwiftUI

struct Grid: View {
    
    @State private var pokemonViewScreen = false
    
    let columns = [
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View{
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach((0...30), id: \.self) {_ in
                        NavigationLink {
                            PokemonView()

                        } label: {
                            PokeBox(name: "Squirtle", id: "007", image: "7", type: "water", background: "waterBackground")
                        }

                        
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
