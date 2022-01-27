//
//  ToDunc.swift
//  ToDuncList
//
//  Created by Duncan Kent on 23/01/2022.
//

import Foundation

struct ToDunc: Identifiable, Codable {
    let id: String 
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ToDunc {
        return ToDunc(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
