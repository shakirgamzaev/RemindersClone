//
//  UIColorTransformer.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 16/10/24.
//

import Foundation
import UIKit

@MainActor
class UIColorTransformer : ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return UIColor.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    // converts from UiColor to Data, so that it can be stored
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else {return nil}
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data

        } catch  {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {return nil}
        do {
            let image = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            return image
        } catch  {
            return nil
        }
    }
}
