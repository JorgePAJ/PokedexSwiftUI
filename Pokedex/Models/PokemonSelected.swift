//
//  PokemonSelected.swift
//  Pokedex
//
//  Created by Jorge Plasencia on 17/01/22.
//

import Foundation

struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    var id: Int
    var types: [PokemonTypes]
}

struct PokemonSprites : Codable {
    var front_default: String?
    var back_default: String?
    var front_shiny: String?
}

struct PokemonTypes: Codable{
    var slot: Int?
    var type: PokemonType?
}

struct PokemonType: Codable{

    var url: String?
    var name: String?
}

class PokemonSelectedApi  {
    func getPokemon(url: String, completion:@escaping (PokemonSelected) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            //print("data: \(data) response: \(response) error: \(error)")
            let pokemonCaught = try! JSONDecoder().decode(PokemonSelected.self, from: data)

            DispatchQueue.main.async {
                completion(pokemonCaught)
            }
        }.resume()
    }
}


