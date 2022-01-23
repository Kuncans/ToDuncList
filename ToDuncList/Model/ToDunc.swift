//
//  ToDunc.swift
//  ToDuncList
//
//  Created by Duncan Kent on 23/01/2022.
//

import Foundation

struct ToDunc: Identifiable {
    
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
