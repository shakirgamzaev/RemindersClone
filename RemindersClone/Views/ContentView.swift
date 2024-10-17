//
//  ContentView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(sortDescriptors: [])  var lists: FetchedResults<MyListMO>
    @State private var isPresented = false
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    Text("My Lists")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .safeAreaPadding(.bottom, 15)
                        .font(.title)
                        .bold()
                    MyListsView(myLists: lists)
                }
                .safeAreaPadding(.horizontal, 15)
                .safeAreaPadding(.top, 20)
                .scrollIndicators(.hidden)
                
                HStack {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Add List")
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Material.bar)
            }
            .sheet(isPresented: $isPresented) {
                AddNewListView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, CoreDataStack(inMemory: true).viewContext)
}
