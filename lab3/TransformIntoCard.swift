//
//  TransformIntoCard.swift
//  lab3
//
//  Created by vashka on 28/11/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier {
    let isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: constans.cornerRadius)
            Group{
                    base.fill(Color.white)
                base.strokeBorder(lineWidth: constans.lineWidth)
                    content
                }
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 :1)
        }
    }
    
    private struct constans{
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}
