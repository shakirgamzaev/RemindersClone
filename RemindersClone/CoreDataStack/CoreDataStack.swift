//
//  CoreDataStack.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//

import Foundation
import CoreData

@MainActor
class CoreDataStack {
    static let shared = CoreDataStack()
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init(inMemory: Bool = false) {
        self.persistentContainer = NSPersistentContainer(name: "RemindersModel")
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
        }
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError(error.localizedDescription)
            }
        }
        
    }
}
