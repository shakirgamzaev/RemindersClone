//
//  ContentView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
                        Rectangle()
                            .frame(height: 30)
                    }
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
}
