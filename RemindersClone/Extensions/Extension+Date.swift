//
//  Extension+Data.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 17/10/24.
//

import Foundation

extension Date {
    var isToday: Bool {
        let calendar = Calendar.current
        if calendar.isDateInToday(self) {
            return true
        }
        return false
    }
    
    var isTomorrow: Bool {
        let calendar = Calendar.current
        if calendar.isDateInTomorrow(self) {
            return true
        }
        return false
    }
}
