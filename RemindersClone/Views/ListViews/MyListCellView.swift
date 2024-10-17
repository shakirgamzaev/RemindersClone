//
//  MyListCellView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 16/10/24.
//

import SwiftUI

struct MyListCellView: View {
    let myList: MyListMO
    
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal.circle.fill")
                .foregroundStyle(Color(uiColor: myList.color ?? .green))
            Text(myList.name ?? "name")
            Spacer()
            Image(systemName: "chevron.right")
        }
        .font(.title3)
    }
}

#Preview {
    @Previewable @State var myList = MyListMO(context: CoreDataStack(inMemory: true).viewContext)
    
    MyListCellView(myList: myList)
        .padding(.horizontal)
}
