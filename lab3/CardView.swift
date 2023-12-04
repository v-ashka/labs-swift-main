//
//  CardView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import Foundation
import SwiftUI


struct CardView: View {
//    @State var isFaceUp : Bool = false
//    let content: String
    
    
    var card: MemoGameModel<String>.Card
    
    init(_ card: MemoGameModel<String>.Card){
        self.card = card
    }
    var body: some View{
                CirclePart(endAngle: .degrees(240))
                    .overlay(
                        Text(card.content)
                        .font(.system(size: 200))
                       .minimumScaleFactor(0.01)
                       .aspectRatio(1/1, contentMode: .fit)
                            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                            .animation(.spin(duration: 1), value: card.isMatched)
                    ).modifier(TransformIntoCard(isFaceUp: card.isFaceUp, isMatched: card.isMatched))
                    .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
                    
//        .onTapGesture(perform: {
//            card.isFaceUp.toggle()
//        })
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View{
        CardView(MemoGameModel<String>.Card.init(content: "", id: ""))
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverse: false)
    }
}

private struct rotateConstans{
    static let rotateDegStart: Angle = Angle(degrees: 0)
    static let rotateDeg: Angle = Angle(degrees: 90)
    static let lineWidth: CGFloat = 2
}
