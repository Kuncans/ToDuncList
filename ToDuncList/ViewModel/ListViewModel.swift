//
//  ListViewModel.swift
//  ToDuncList
//
//  Created by Duncan Kent on 26/01/2022.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var toDuncs: [ToDunc] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "toDuncs_list"
    
    init() {
        getItems()
    }
    
    func getItems () {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ToDunc].self, from: data)
        else { return }
        
        self.toDuncs = savedItems
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(toDuncs) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

}
