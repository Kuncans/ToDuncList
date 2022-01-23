//
//  AddView.swift
//  ToDuncList
//
//  Created by Duncan Kent on 23/01/2022.
//

import SwiftUI

struct AddView: View {
    
    @State var addItemText: String = ""
    
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $addItemText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(hue: 0.305, saturation: 0.0, brightness: 0.94))
                .cornerRadius(10)
            
            Button {
                print("tapped")
            } label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }

            
        }.padding(14)
        .navigationTitle("Add An Item 💬")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
