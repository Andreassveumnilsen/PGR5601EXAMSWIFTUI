//
//  SettingsView.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 11/11/2021.
//

import SwiftUI

struct SettingsView: View {
    let persistenceController = PersistenceController.shared
    
    @State private var apiSeed: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    TextField(
                        "Type in new apiseed",
                        text:$apiSeed
                    )
                        .onSubmit {
                            persistenceController.saveSeed(apiSeed)
                        }
                    
                }
                .navigationTitle("Change Api seed")
                
            }
        }
    }
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
    
}
