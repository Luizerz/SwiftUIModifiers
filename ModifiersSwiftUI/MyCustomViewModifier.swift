//
//  MyCustomViewModifier.swift
//  ModifiersSwiftUI
//
//  Created by Luiz Sena on 20/04/23.
//

import Foundation
import SwiftUI

enum MyAnimationEnum {
    case linear
    case easeInOut
}


extension View {
    func cardModifier(width: CGFloat, height: CGFloat, animationType: MyAnimationEnum) -> some View {
        modifier(
            MyCard(geo: (width, height), animationType: animationType)
        )
    }
}

struct MyCard: ViewModifier {
    var geo: (width: CGFloat, height: CGFloat)
    var animationType: MyAnimationEnum?
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
            withAnimation(verifyAnimationType(with: animationType)) {
                willFlip = true
            }
        }
    }

    func verifyAnimationType(with animation: MyAnimationEnum?) -> Animation {
        switch animation {
        case .easeInOut:
            return .easeInOut(duration: 2).delay(0.5).repeatForever(autoreverses: false)
        case .linear:
            return .linear(duration: 5).repeatForever()
        default:
            return .linear
        }
    }
}
