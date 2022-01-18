//
//  PokemonView.swift
//  Pokedex
//
//  Created by Jorge Plasencia on 01/12/21.
//

import SwiftUI

struct PokemonView: View {
    @State var name: String
    @State var url: String
    
    @State var info: PokemonSelected?

    func poblar(url: String) -> ()  {
        PokemonSelectedApi().getPokemon(url: url){ datos in
            self.info = datos
        }
    }
    
    var body: some View {
        VStack {
            pokePics(isShiny: true,link: url)
            Text("Pokemon View de \(name)")
            Text(info?.types[0].type?.name ?? "default")
            PokemonImage(select: 0,imageLink:url)
        }.navigationTitle(name.capitalizingFirstLetter())
        .onAppear {
            poblar(url: url)
        }
    }
}

struct pokePics:View{
    @State var isShiny: Bool = false
    @State var link : String
    var body: some View{
        VStack{
            if isShiny {
                PokemonImage(select: 1, imageLink: link)
            }else{
                PokemonImage(select: 0, imageLink: link)
            }
            Button {
                isShiny.toggle()
            } label: {
                Text("Toggle shiny")
            }

        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(name: "Pepito",url: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}
