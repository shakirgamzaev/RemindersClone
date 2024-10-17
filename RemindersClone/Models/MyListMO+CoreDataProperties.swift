//
//  MyListMO+CoreDataProperties.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 17/10/24.
//
//

import Foundation
import CoreData
import SwiftUI


extension MyListMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyListMO> {
        return NSFetchRequest<MyListMO>(entityName: "MyList")
    }

    @NSManaged public var color: UIColor?
    @NSManaged public var name: String?
    @NSManaged public var reminders: NSSet?

}

// MARK: Generated accessors for reminders
extension MyListMO {

    @objc(addRemindersObject:)
    @NSManaged public func addToReminders(_ value: ReminderMO)

    @objc(removeRemindersObject:)
    @NSManaged public func removeFromReminders(_ value: ReminderMO)

    @objc(addReminders:)
    @NSManaged public func addToReminders(_ values: NSSet)

    @objc(removeReminders:)
    @NSManaged public func removeFromReminders(_ values: NSSet)

}

extension MyListMO : Identifiable {

}

extension MyListMO {
    override public func awakeFromInsert() {
        self.color = UIColor(Color.red)
        self.name = "previewList"
    }
}
