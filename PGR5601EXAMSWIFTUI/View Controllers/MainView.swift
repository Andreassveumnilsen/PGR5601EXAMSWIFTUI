//
//  MainView.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 11/11/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
       TabView{
            ContentView()
               .tabItem{
                   Image(systemName: "person")
                   Text("Contacts")
               }
            MapView()
               .tabItem{
                   Image(systemName: "map")
                   Text("Map")
               }
                   
            SettingsView()
               .tabItem{
                   Image(systemName: "gearshape")
                   Text("Settings")
               }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        MapView()
        SettingsView()
    }
}
