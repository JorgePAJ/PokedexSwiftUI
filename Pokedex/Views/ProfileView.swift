//
//  ProfileView.swift
//  Pokedex
//
//  Created by Jorge Plasencia on 01/12/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
       
        NavigationView {
            VStack {
                Text("Profile View")
                NavigationLink(destination: SettingsView()) {
                    Text("Placeholder Settings")
                        .font(.body)
                        .foregroundColor(Color.blue)
                }
                NavigationLink(destination: LoginView()) {
                    Text("Placeholder login")
                        .font(.body)
                        .foregroundColor(Color.red)
                }

            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
