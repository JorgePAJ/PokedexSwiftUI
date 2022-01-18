import SwiftUI

struct Grid: View {
    @State var pokemon = [PokemonEntry]()
    @State var pokemonInfo :PokemonSelected?

//    @State var pokemonInfo : PokemonSelected
    @State var searchText = ""
    let columns = [
        GridItem(.flexible()), GridItem(.flexible())
    ]

    func tryout(Pokemon: PokemonEntry) -> () {
        PokemonSelectedApi().getPokemon(url: Pokemon.url){ datos in
   
            self.pokemonInfo = datos
        }
    }
    
    func filler(entry:PokemonEntry) ->(PokeBox){
        return PokeBox(name: entry.name, id: pokemonInfo?.id ?? 690, image: entry.url, type: (pokemonInfo?.types[0].type?.name ?? "water"), background: "waterBackground")
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(searchText == "" ? pokemon : pokemon.filter({
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack{
                        filler(entry: entry)
                            
                            .padding(.trailing, 20)
                            .onAppear {
                                print("la entri: \(entry)")
                            }// Placeholder pkm img
                        NavigationLink("\(entry.name)".capitalized,destination: PokemonView())
                    }
                }
            }
            .onAppear(perform: {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                    
                }
            })
            .searchable(text: $searchText)
            .navigationTitle("PokedexUI")
        }
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
