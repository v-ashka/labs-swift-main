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
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group{
                    base.fill(Color.white)
                    base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                   .minimumScaleFactor(0.01)
                   .aspectRatio(1/1, contentMode: .fit)
                }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 :1)
        }
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
