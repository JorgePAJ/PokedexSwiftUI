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
                Spacer()
                    .frame(height: 250)

                
                Image("teamBuilder")
                    .resizable()
                    .frame(width: 300, height: 70, alignment: .center)
                    .aspectRatio( contentMode: .fit)
                    .padding(.horizontal)
                
                teamOptions()
                    .padding(.vertical,30)
                
                Button(action: {}) {
                    Text("RANDOMIZE")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .lineLimit(nil)
                        .background(
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("PokemonRed"))
                                        .frame(width: 200, height: 40, alignment: .center)
                                
                                RoundedRectangle(cornerRadius:10)
                                    .strokeBorder(.black, lineWidth: 1)
                                
                                
                            }
                                        
                        )
                        .foregroundColor(.white)
                        
                }
                .padding(.bottom,300)
            }
            .frame(alignment: .center)
        }
    }
}


struct teamOptions: View{
    @State private var showingSheet = false
    @State var button1 : String?
    @State var button2 : String?
    @State var button3 : String?
    @State var button4 : String?
    @State var button5 : String?
    @State var button6 : String?
    
    
    var body: some View{
        VStack{
            HStack{
                Button(action: {
                    showingSheet.toggle()
                }) {
                    botonTeam(linkto: button1)
                }
                Button(action: {showingSheet.toggle()}) {
                    botonTeam(linkto: button2)
                }
                .padding(.horizontal,15)
                Button(action: {showingSheet.toggle()}) {
                    botonTeam(linkto: button3)
                }

            }
            .padding(.vertical,15)
            HStack{
                Button(action: {showingSheet.toggle()}) {
                    botonTeam(linkto: button4)
                }
                Button(action: {showingSheet.toggle()}) {
                    botonTeam(linkto: button5)
                }
                .padding(.horizontal,15)
                Button(action: {showingSheet.toggle()}) {
                    botonTeam(linkto: button6)
                }

            }
        }        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Picker()
    }
}

struct botonTeam: View{
    @State var linkto: String?
    var body: some View{
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("BotonTeam"))
                .frame(width: 80, height: 80)
                
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(.black,lineWidth: 1)
                .frame(width: 80, height: 80)
            
            PokemonImage(select: 0, imageLink: linkto ?? "https://pokeapi.co/api/v2/pokemon/1/")                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }
}

struct TeamBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        TeamBuilderView()
    }
}

