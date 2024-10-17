//
//  MyListMO+CoreDataProperties.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//
//

import Foundation
import CoreData
import UIKit
import SwiftUI

extension MyListMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyListMO> {
        return NSFetchRequest<MyListMO>(entityName: "MyList")
    }

    @NSManaged public var color: UIColor?
    @NSManaged public var name: String?

}

extension MyListMO : Identifiable {

}

extension MyListMO {
    override public func awakeFromInsert() {
        self.color = UIColor(Color.red)
        self.name = "previewList"
    }
}
