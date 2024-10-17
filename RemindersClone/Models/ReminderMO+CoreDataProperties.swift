//
//  ReminderMO+CoreDataProperties.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 16/10/24.
//
//

import Foundation
import CoreData


extension ReminderMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderMO> {
        return NSFetchRequest<ReminderMO>(entityName: "Reminder")
    }

    @NSManaged public var title: String?
    @NSManaged public var notes: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var reminderDate: Date?
    @NSManaged public var reminderTime: Date?
    @NSManaged public var myList: MyListMO?

}

extension ReminderMO : Identifiable {

}

extension ReminderMO {
    override public func awakeFromInsert() {
        title = "title"
        notes = "notes"
        isCompleted = false
        reminderDate = Calendar.current.date(byAdding: .month, value: 1, to: Calendar.current.startOfDay(for: Date.now))
        reminderTime = Date.now
        
    }
}
