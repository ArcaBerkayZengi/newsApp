//
//  AppcentProjeApp.swift
//  AppcentProje
//
//  
//

import SwiftUI

@main
struct AppcentProjeApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
}
