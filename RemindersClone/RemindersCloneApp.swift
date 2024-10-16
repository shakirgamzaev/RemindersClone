//
//  RemindersCloneApp.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//

import SwiftUI

@main
struct RemindersCloneApp: App {
    @State private var coreDataStack = CoreDataStack.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataStack.viewContext)
        }
    }
}
