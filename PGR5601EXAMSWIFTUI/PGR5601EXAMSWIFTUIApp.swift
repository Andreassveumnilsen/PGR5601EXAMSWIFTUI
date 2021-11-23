//
//  PGR5601EXAMSWIFTUIApp.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 02/11/2021.
//

import SwiftUI

@main
struct PGR5601EXAMSWIFTUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
