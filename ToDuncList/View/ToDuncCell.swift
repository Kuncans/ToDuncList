//
//  ToDuncCell.swift
//  ToDuncList
//
//  Created by Duncan Kent on 23/01/2022.
//

import SwiftUI

struct ToDuncCell: View {
    
    let item: ToDunc
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            withAnimation(.easeInOut(duration: 0.6)) {
            Text(item.title)
                    .strikethrough(item.isCompleted, color: Color.primary)
            }
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 12)
    }
}

struct ToDuncCell_Previews: PreviewProvider {
    
    static var item1 = ToDunc(title: "This is a test ToDunc. Don't bother doing this.", isCompleted: false)
    
    static var item2 = ToDunc(title: "Apples are oranges divided by mangos!", isCompleted: true)

    
    static var previews: some View {
        Group {
            ToDuncCell(item: item1)
            ToDuncCell(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
