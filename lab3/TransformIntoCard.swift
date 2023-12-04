//
//  TransformIntoCard.swift
//  lab3
//
//  Created by vashka on 28/11/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier, Animatable {
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    let isMatched: Bool
    
    var rotation: Double
    
    var animatableData: Double {
        get{ rotation}
        set {rotation = newValue}
    }
    
    func body(content: Content) -> some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: constans.cornerRadius)
                base.strokeBorder(lineWidth: constans.lineWidth)
                    .background(base.fill(.white))
                    .overlay(content)
                    .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 :1)
              
        }
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
    }
    
    private struct constans{
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let animationDur: CGFloat = 2
        static let rotateDeg: Angle = Angle(degrees: -120)
    }
}
