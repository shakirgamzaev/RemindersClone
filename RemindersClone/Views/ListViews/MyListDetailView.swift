//
//  MyListDetailView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 17/10/24.
//

import SwiftUI


/// this list shows a list of all reminders that belong to a particular list
struct MyListDetailView: View {
    let myList: MyListMO
    @State private var isAlertPresented = false
    @State private var reminderName = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        List {
            VStack {
                // List Of reminders
            }
            .navigationTitle(Text(myList.name ?? "list").foregroundStyle(.orange))
            .navigationBarTitleDisplayMode(.large)
            .listRowSeparator(.hidden)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //Add Reminder
                        isAlertPresented = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("New Reminder")
                        }
                        .foregroundStyle(Color(uiColor: myList.color ?? .blue))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Menu("Sort By:") {
                            Button {
                                
                            } label: {
                                Text("Creation Date")
                            }
                            Button {
                                
                            } label: {
                                Text("Name")
                            }

                        }

                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }

                }
            }
            .alert("New Reminder", isPresented: $isAlertPresented) {
                TextField("Reminder Name", text: $reminderName, prompt: Text("Reminder Name"))
                Button {
                    //Cancel do nothing
                } label: {
                    Text("Cancel")
                }
                Button {
                    //Add new Reminder to a list of Reminders for this list
                    if !reminderName.isEmpty {
                        ListService.saveReminderToList(myList, viewContext, title: reminderName)
                    }
                } label: {
                    Text("Add")
                }


            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    @Previewable @State var list =  MyListMO(context: CoreDataStack(inMemory: true).viewContext)
    
    NavigationStack {
        MyListDetailView(myList: list)
    }
}
