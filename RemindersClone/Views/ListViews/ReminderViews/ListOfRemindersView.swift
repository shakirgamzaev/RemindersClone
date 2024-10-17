//
//  ListOfRemindersView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 17/10/24.
//

import SwiftUI

struct ListOfRemindersView: View {
    let reminders: FetchedResults<ReminderMO>
    
    var body: some View {
        ForEach(reminders) { reminder in
            VStack {
                ReminderCellView(reminder: reminder)
                Divider()
            }
        }
    }
}

//#Preview {
//    @Previewable @State var list =  MyListMO(context: CoreDataStack(inMemory: true).viewContext)
//    
//    ListOfRemindersView(list: list)
//}
