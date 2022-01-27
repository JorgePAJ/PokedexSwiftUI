//
//  PokeBox.swift
//  Pokedex
//
//  Created by Diego Mojarro on 02/12/21.
//

import SwiftUI

struct PokeBox: View {
    @State var name: String
    @State var image : String

    var body: some View {
        VStack {
            VStack{
                VStack{
                    Text(name).foregroundColor(.black)
                        .fontWeight(.medium).bold().frame(maxWidth: .infinity).padding(.trailing, 70).padding(.top, 10)
                    Spacer()
                }
                
                ZStack{
                    PokemonImage(select: 0 ,imageLink: image)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                         .padding(.leading,80)
                         .padding(.bottom,60)
                         .padding(.trailing,10)
                }.frame(width: 10, height: 20)
            }
            .frame(width: 170, height: 100).background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)).background(RoundedRectangle(cornerRadius: 10).fill(Color("Background")))
        
        }
    }
}

struct PokeBox_Previews: PreviewProvider {
    static var previews: some View {
        PokeBox(name: "squirtle", image: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}
