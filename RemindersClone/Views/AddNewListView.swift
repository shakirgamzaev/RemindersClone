//
//  AddNewListView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//

import SwiftUI

struct AddNewListView: View {
    @State private var selectedColor: Color = .green
    @State private var listName = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    var isEmptyName: Bool {
        return listName.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .foregroundStyle(selectedColor)
                            .font(.system(size: 100))
                        TextField("List name", text: $listName, prompt: Text("List Name"))
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 7)
                            .background {
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(uiColor: .systemGray4), lineWidth: 2)
                            }
                    }
                    .safeAreaPadding(.bottom, 50)
                    
                    ColorPickerView(selectedColor: $selectedColor)
                }
                .padding()
                .navigationTitle("New List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            //dismiss and save the new list into persisten store with core data
                            do {
                                try saveNewListToDataBase()
                                dismiss()
                            }
                            catch {
                                print(error.localizedDescription)
                                dismiss()
                            }
                            
                        } label: {
                            Text("Done")
                        }
                        .disabled(isEmptyName)
                        
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Close")
                        }

                    }
                }
            }
        }
    }
}

extension AddNewListView {
    func saveNewListToDataBase() throws {
        try ListService.saveList(listName, UIColor(selectedColor), viewContext)
    }
}

#Preview {
    AddNewListView()
}
