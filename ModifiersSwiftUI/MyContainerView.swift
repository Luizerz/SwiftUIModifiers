//
//  MyContainerView.swift
//  ModifiersSwiftUI
//
//  Created by Luiz Sena on 22/05/23.
//

import SwiftUI

struct MyContainerView: View {
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .frame(width: 50, height: 50)  //Tamanho do circulo
                .cardModifier(width: 100, height: 100, animationType:  .easeInOut) //Tamanho do RoundedRectangle
            Spacer()
            Text("Hello World")
                .windowOpeningModifier()
            Spacer()

        }
    }
}

struct MyContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MyContainerView()
    }
}
