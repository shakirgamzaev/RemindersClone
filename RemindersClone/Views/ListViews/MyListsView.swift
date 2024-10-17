//
//  ListCellView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 16/10/24.
//

import SwiftUI

///A view that displays all lists created by a user.
///
///This view is called from ContentView and is the main view that is shown first when an app launches

struct MyListsView: View {
    let myLists: FetchedResults<MyListMO>
    
    var body: some View {
        VStack {
            ForEach(myLists) { list in
                NavigationLink(value: list) {
                    VStack {
                        MyListCellView(myList: list)
                        Divider()
                    }
                }
            }
            .navigationDestination(for: MyListMO.self) { list in
                MyListDetailView(myList: list)
            }
        }
    }
}

/*
#Preview {
    ListCellView()
}*/
