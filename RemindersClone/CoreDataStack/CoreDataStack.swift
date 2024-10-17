//
//  CoreDataStack.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//

import Foundation
import CoreData
import UIKit

class CoreDataStack {
    @MainActor static let shared = CoreDataStack()
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init(inMemory: Bool = false) {
        self.persistentContainer = NSPersistentContainer(name: "RemindersModel")
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        if inMemory {
            //persistentContainer.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
            persistentContainer.persistentStoreDescriptions = [NSPersistentStoreDescription(url: URL(filePath: "/dev/null"))]
        }
        
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                print("some error occured when initializing persistent container")
                fatalError(error.localizedDescription)
            }
            if inMemory {
                self.AddMockData()
            }
        }
        
    }
}

extension CoreDataStack {
    private func AddMockData() {
        let newList = MyListMO(context: viewContext)
        newList.name = "previewList"
        newList.color = UIColor(.red)
        let newList2 = MyListMO(context: viewContext)
        newList2.name = "previewList2"
        newList2.color = UIColor(.green)
        
        do {
            try viewContext.save()
        } catch  {
            print("error saving view context")
        }
    }
}
