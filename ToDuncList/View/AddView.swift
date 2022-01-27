//
//  AddView.swift
//  ToDuncList
//
//  Created by Duncan Kent on 23/01/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var addItemText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $addItemText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(hue: 0.305, saturation: 0.0, brightness: 0.94))
                .cornerRadius(10)
                .foregroundColor(.black)
            
            Button {
                onSave()
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
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func onSave() {
        if textIsAppropriate() {
            listViewModel.addItem(title: addItemText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if addItemText.count < 5 {
            alertTitle = "ToDunc too short.\nCmon, put some effort in ⚡️"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
