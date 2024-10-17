//
//  ListService.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 16/10/24.
//

import Foundation
import CoreData
import UIKit

@MainActor
class ListService {
    
    static func saveContext(_ managedContext: NSManagedObjectContext) throws {
        try managedContext.save()
    }
    
    static func saveList(_ name: String, _ color: UIColor, _ managedContext: NSManagedObjectContext) throws {
        print("saveList called")
        let newList = MyListMO(context: managedContext)
        newList.color = color
        newList.name = name
        try saveContext(managedContext)
    }
    
    static func saveReminderToList(
        _ list: MyListMO,
        _ managedContext: NSManagedObjectContext,
        title: String) {
            let newReminder = ReminderMO(context: managedContext)
            newReminder.myList = list
            newReminder.title = title
            do {
                try saveContext(managedContext)
            } catch  {
                print(error.localizedDescription)
            }
    }
}
