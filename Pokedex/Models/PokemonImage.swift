//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Jorge Plasencia on 17/01/22.
//

import SwiftUI

struct PokemonImage: View {
    @State var select: Int
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 75, height: 75)
            .onAppear {
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil{
                    if(select == 0){
                        getSprite(url: imageLink)
                    }else{
                        getSpriteShiny(url: imageLink)
                    }
                    UserDefaults.standard.set(imageLink,forKey: imageLink)
                    print("New url!! Caching...")
                }else{
                    if(select == 0){
                        getSprite(url: loadedData!)
                        print("Using cached url...")
                    }else{
                        getSpriteShiny(url: imageLink)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .foregroundColor(Color.gray.opacity(0.60))
        }
    
    func getSprite(url: String) {
        var tempSprite: String?
        
        PokemonSelectedApi().getPokemon(url: url) { sprite in
            tempSprite = sprite.sprites.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
    
    
    func getSpriteShiny(url: String) {
        var tempSprite: String?
        
        PokemonSelectedApi().getPokemon(url: url) { sprite in
            tempSprite = sprite.sprites.front_shiny
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage(select: 0)
    }
}
