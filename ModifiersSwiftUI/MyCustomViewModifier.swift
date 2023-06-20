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

    func windowOpeningModifier() -> some View {
        modifier(
            WindowOpening()
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

struct WindowOpening: ViewModifier {
    @State var isOpening: Bool = false
    func body(content: Content) -> some View {
            content
                .overlay {
                    HStack {
                        GeometryReader { geo in
                            HStack {
                                Spacer()
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.pink)
                                    .frame(width: isOpening ? 0 : geo.size.width)
                            }
                            .frame(width: geo.size.width)
                        }
                    }
                    .clipped()
                }


        .onAppear {
            withAnimation(.easeOut(duration: 5)) {
                isOpening = true
            }

        }

    }
}


struct ModifiersProvider_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Circle()
                .frame(width: 50, height: 50)
                .cardModifier(width: 100, height: 100, animationType: .easeInOut)
            Spacer()
            Text("Hello World")
                .windowOpeningModifier()
            Spacer()
        }
    }
}
