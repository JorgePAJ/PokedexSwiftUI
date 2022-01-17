import SwiftUI

struct Grid: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    let columns = [
        GridItem(.flexible()), GridItem(.flexible())
    ]

    
    var body: some View {
        NavigationView {
            List{
                ForEach(searchText == "" ? pokemon : pokemon.filter({
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack{
                        PokemonImage(imageLink: "\(entry.url)")
                            .padding(.trailing, 20)// Placeholder pkm img
                        NavigationLink("\(entry.name)".capitalized,destination: Text("Detail view for \(entry.name)"))
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
        .navigationBarHidden(true)
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
