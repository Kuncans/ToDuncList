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
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To Dunc Items ✔")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

