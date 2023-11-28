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
                    ).modifier(TransformIntoCard(isFaceUp: card.isFaceUp))
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
