//
//  MyCustomViewModifier.swift
//  ModifiersSwiftUI
//
//  Created by Luiz Sena on 20/04/23.
//

import Foundation
import SwiftUI

extension View {
    func cardModifier(width: CGFloat, height: CGFloat) -> some View {
        modifier(
            MyCard(geo: (width, height))
        )
    }
}

struct MyCard: ViewModifier {
    var geo: (width: CGFloat, height: CGFloat)
    @State var willFlip: Bool = false
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.thinMaterial)
                .frame(width: geo.width, height: geo.height)
            content
        }
        .rotationEffect(willFlip ? Angle(degrees: 360) : Angle.zero)
        .onAppear {
            withAnimation(.easeInOut(duration: 2).delay(0.5).repeatForever(autoreverses: false)) {

                willFlip = true
            }
        }
    }
}
