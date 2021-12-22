//
//  Grid.swift
//  Pokedex
//
//  Created by Diego Mojarro on 07/12/21.
//

import SwiftUI

struct Grid: View {
        
    let columns = [
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View{
        ScrollView {
            LazyVGrid(columns: columns, spacing: 40) {
                ForEach((0...30), id: \.self) {_ in
                    Button {
                        
                    } label: {
                        PokeBox()
                    }

                    
                }
            }
            .padding(.horizontal)
        }
        
    }
    
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
