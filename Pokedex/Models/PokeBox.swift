//
//  PokeBox.swift
//  Pokedex
//
//  Created by Diego Mojarro on 02/12/21.
//

import SwiftUI

struct PokeBox: View {
    @State var name: String
    @State var id : String
    @State var image : String
    @State var type: String
    @State var background: String
    
    var body: some View {
        VStack {
            VStack{
                VStack{
                Text(name).foregroundColor(.black).bold().frame(maxWidth: .infinity).padding(.trailing, 70).padding(.top, 10)
                Text("\(id)").foregroundColor(.black).font(.caption)
                }
                
                ZStack{
                    Image(image).resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80).padding(.leading,80)
                }.frame(width: 10, height: 20)
                    
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    HStack{
                        Image("\(type)").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 12).padding(.leading,10)
                    }
                
                }.frame(height : 20)
                
            }
            .frame(width: 150, height: 100).background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)).background(RoundedRectangle(cornerRadius: 10).fill(Color(background)))
        
        }
        
        
        
    }
}

struct PokeBox_Previews: PreviewProvider {
    static var previews: some View {
        PokeBox(name: "squirtle", id: "007", image: "7", type: "water", background: "waterBackground")
    }
}