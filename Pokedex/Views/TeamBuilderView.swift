//
//  TeamBuilderView.swift
//  Pokedex
//
//  Created by Jorge Plasencia on 01/12/21.
//

import SwiftUI

struct TeamBuilderView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                Image("teamBuilder")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .padding()
                
                teamOptions()
                    .padding(.vertical,30)
                Button(action: {}) {
                    Text("RANDOMIZE")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .lineLimit(nil)
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(.black, lineWidth: 2)
                                        .background(Color("PokemonRed"))
                                        .frame(width: 200, height: 40, alignment: .center))
                                  
                                        
                        .foregroundColor(.white)
                        
                }
                .padding(.bottom,300)
            }
        }
    }
}


struct teamOptions: View{
    var body: some View{
        VStack{
            HStack{
                Text("hola")
                Text("hola")
                Text("hola")
            }
            HStack{
                Text("hola")
                Text("hola")
                Text("hola")
            }
        }
    }
}


struct TeamBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        TeamBuilderView()
    }
}

