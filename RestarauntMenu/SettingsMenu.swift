//
//  SettingsMenu.swift
//  RestarauntMenu
//
//  Created by Marko Jovanov on 20.1.22.
//

import SwiftUI

struct SettingsMenu: View {
    @AppStorage("orangeMenu") private var orangeMenu = "On"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Settings: ")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                HStack(spacing: 50) {
                    Text("Orange mode:")
                        .padding(.leading)
                    Spacer()
                    Picker("Dark mode", selection: $orangeMenu) {
                        Text("On").tag("On")
                        Text("Off").tag("Off")
                    }
                    .pickerStyle(.segmented)
                    .padding(.trailing)
                    .onChange(of: orangeMenu) { orangeMenu in
                        UserDefaults.standard.set(orangeMenu, forKey: "orangeMenu")
                    }
                }
                NavigationLink(destination: MapView()) {
                    Text("Open restaraunt location")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(24)
                }
                .padding()
                Spacer()
            }
            .background(orangeMenu == "Off" ? Color.white : Color.orange)
        }
    }
}

struct SettingsMenu_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMenu()
    }
}
