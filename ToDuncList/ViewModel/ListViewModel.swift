//
//  ListViewModel.swift
//  ToDuncList
//
//  Created by Duncan Kent on 26/01/2022.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var toDuncs: [ToDunc] = []
    
    init() {
        getItems()
    }
    
    func getItems () {
        let newDuncs = [
            ToDunc(title: "Get out of bed", isCompleted: false),
            ToDunc(title: "Eat 142 pineapples", isCompleted: true),
            ToDunc(title: "Win village simulator 2048", isCompleted:false)
        ]
        toDuncs.append(contentsOf: newDuncs)
    }
    
    func deleteItem(indexSet: IndexSet) {
        toDuncs.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        toDuncs.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ToDunc(title: title, isCompleted: false)
        toDuncs.append(newItem)
    }
    
    func updateItem(toDunc: ToDunc) {
        if let index = toDuncs.firstIndex(where: { $0.id == toDunc.id }) {
            toDuncs[index] = toDunc.updateCompletion()
        }
        
    }

}
