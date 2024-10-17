//
//  ReminderCellView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 17/10/24.
//

import SwiftUI

struct ReminderCellView: View {
    let reminder: ReminderMO
    @State private var isReminderMarkedComplete = false
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .stroke(.gray, lineWidth: 2)
                    .frame(width: 26, height: 26)
                if isReminderMarkedComplete {
                    Circle()
                        .fill(.gray)
                        .frame(width: 21, height: 21)
                }
            }
            VStack(alignment: .leading) {
                Text(reminder.title ?? "noTitle")
                HStack {
                    if let date = reminder.reminderDate {
                        Text(formattedDate(date: date) + ",")
                    }
                    if let time = reminder.reminderTime {
                        Text(time.formatted(date: .omitted, time: .shortened))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            isReminderMarkedComplete.toggle()
        }
    }
}

extension ReminderCellView {
    private func formattedDate(date: Date) -> String {
        if date.isToday {
            return "Today"
        }
        else if date.isTomorrow {
            return "Tomorrow"
        }
        else {
            return date.formatted(date: .numeric, time: .omitted)
        }
    }
}


#Preview {
    @Previewable @State var reminder = ReminderMO(context: CoreDataStack(inMemory: true).viewContext)
    
    ReminderCellView(reminder: reminder)
}
