//
//  ListView.swift
//  ToDuncList
//
//  Created by Duncan Kent on 23/01/2022.
//

import SwiftUI

struct ListView: View {
    
    @State private var toDuncs: [ToDunc] = [
        ToDunc(title: "Get out of bed", isCompleted: false),
        ToDunc(title: "Eat 142 pineapples", isCompleted: true),
        ToDunc(title: "Win village simulator 2048", isCompleted:false)]
    
    var body: some View {
        
        List {
            ForEach(toDuncs) { toDunc in
                ToDuncCell(item: toDunc)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To Dunc Items ✔")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView())
        )
    }
    
    func deleteItem(indexSet: IndexSet) {
        toDuncs.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        toDuncs.move(fromOffsets: from, toOffset: to)
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

