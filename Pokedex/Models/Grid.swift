import SwiftUI

struct Grid: View {
    @State var pokemon = [PokemonEntry]()
    @State var pokemonInfo :PokemonSelected?

//    @State var pokemonInfo : PokemonSelected
    @State var searchText = ""
    let columns = [
        GridItem(.flexible(),spacing: 2),
        GridItem(.flexible(),spacing: 2)
    ]
    
    
    func filler(entry:PokemonEntry) ->(PokeBox){
        
        return PokeBox(name: entry.name.capitalizingFirstLetter(), image: entry.url)
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns,spacing: 10){
                ForEach(searchText == "" ? pokemon : pokemon.filter({
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    
                    HStack{
                        NavigationLink(destination: {
                            PokemonView(name: entry.name, url: entry.url)
                        }, label: {
                            filler(entry: entry)
                        })
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
