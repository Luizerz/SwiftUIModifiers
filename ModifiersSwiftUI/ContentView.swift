//
//  ContentView.swift
//  ModifiersSwiftUI
//
//  Created by Luiz Sena on 20/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.clear)
                ScrollView {
                    VStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .cardModifier(width: geo.size.width/2, height: geo.size.height/4, animationType: .linear)
                            .padding()
                        Text("SecondText")
                            .cardModifier(width: geo.size.width/2, height: geo.size.height/4, animationType: .linear)
                            .padding()
                        Button {
                            print("Nice!")
                        } label: {
                            Text("I'm a Button")
                                .cardModifier(width: geo.size.width/3, height: geo.size.height/10, animationType:
                                        .easeInOut)
                        }
                        .padding()
                        //                        TextField("Text Field", text: .constant("Text Field"))
                        //                            .textFieldStyle(.roundedBorder)
                        //                            .frame(width: 150)
                        //                            .shadow(color: .primary, radius: 1)
                        //                            .modifier(WindowOpening())
                        //                            .multilineTextAlignment(.center)
                        //                            .padding()
                    }
                    .frame(width: geo.size.width)
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
