//
//  ListView.swift
//  ToDuncList
//
//  Created by Duncan Kent on 23/01/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.toDuncs.isEmpty {
                NoToDuncsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.toDuncs) { toDunc in
                        ToDuncCell(item: toDunc)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    listViewModel.updateItem(toDunc: toDunc)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
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
        .environmentObject(ListViewModel())
    }
}

