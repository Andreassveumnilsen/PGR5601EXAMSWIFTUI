//
//  PGR5601EXAMSWIFTUIApp.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 23/11/2021.
//

import SwiftUI

@main
struct PGR5601EXAMSWIFTUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
