//
//  ContentView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
                        Text("My Lists")
                    }
                    .frame(maxWidth: .infinity)
                }
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
