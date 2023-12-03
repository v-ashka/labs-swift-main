//
//  TransformIntoCard.swift
//  lab3
//
//  Created by vashka on 28/11/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier {
    let isFaceUp: Bool
    let isMatched: Bool
    func body(content: Content) -> some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: constans.cornerRadius)
            Group{
                    base.fill(Color.white)
                base.strokeBorder(lineWidth: constans.lineWidth)
                    content  
                    .rotationEffect(isMatched ? constans.rotateDeg : Angle(degrees: 0))
                    .animation(isMatched ? .easeInOut(duration: constans.animationDur) : .smooth)
                
                }
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 :1)
              
        }
    }
    
    private struct constans{
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let animationDur: CGFloat = 2
        static let rotateDeg: Angle = Angle(degrees: -120)
    }
}
