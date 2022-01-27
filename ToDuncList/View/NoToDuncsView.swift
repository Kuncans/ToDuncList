//
//  NoToDuncsView.swift
//  ToDuncList
//
//  Created by Duncan Kent on 27/01/2022.
//

import SwiftUI

struct NoToDuncsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                Text("There are no items.")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Let's get going!\n\n Add some items to your to do list now!")
                NavigationLink(destination: AddView()) {
                    Text("Add Something! 🎉")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                        .padding(.top, 32)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.2 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoToDuncsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoToDuncsView()
                .navigationTitle("Title")
        }
    }
}
