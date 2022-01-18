import SwiftUI

struct Grid: View {
    @State var pokemon = [PokemonEntry]()
    @State var pokemonInfo :PokemonSelected?

//    @State var pokemonInfo : PokemonSelected
    @State var searchText = ""
    let columns = [
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    func backgroundPicker(Type:String) -> String {
        switch Type{
        case "bug":
            return "bugBackground"
        case "dark":
            return "darkBackground"
        case "dragon":
            return "dragonBackground"
        case "electric":
            return "electricBackground"
        case "fairy":
            return "fairyBackground"
        case "fighting":
            return "fightingBackground"
        case "fire":
            return "fireBackground"
        case "flying":
            return "flyingBackground"
        case "ghost":
            return "ghostBackground"
        case "grass":
            return "grassBackground"
        case "ground":
            return "groundBackground"
        case "ice":
            return "iceBackground"
        case "normal":
            return "normalBackground"
        case "poison":
            return "poisonBackground"
        case "psychic":
            return "psychicBackground"
        case "rock":
            return "rockBackground"
        case "steel":
            return "steelBackground"
        case "water":
            return "waterBackground"
            
        default:
            return "waterBackground"
        }
    }
    
    func filler(entry:PokemonEntry) ->(PokeBox){
        
        return PokeBox(name: entry.name, id: pokemonInfo?.id ?? 690, image: entry.url, type: (pokemonInfo?.types[0].type?.name ?? "fire"), background: backgroundPicker(Type: pokemonInfo?.types[0].type?.name ?? "bug"))
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
            LazyVGrid(columns: columns){
                ForEach(searchText == "" ? pokemon : pokemon.filter({
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    
                    HStack{
                        
                        NavigationLink(destination: PokemonView()) {
                            filler(entry: entry)
                        }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.async {
                    PokeApi().getData() { pokemon in
                        self.pokemon = pokemon
                        
                        for pokemons in pokemon {
                            PokemonSelectedApi().getPokemon(url: pokemons.url){ datos in
                                self.pokemonInfo = nil
                                self.pokemonInfo = datos

                            }
                        }
                    }
                }

            })
            .searchable(text: $searchText)
            .navigationTitle("PokedexUI")
        }
        }.navigationBarHidden(true)
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
