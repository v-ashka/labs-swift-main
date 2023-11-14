//
//  MemoGameModel.swift
//  lab3
//
//  Created by student on 07/11/2023.
//


// Model
import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>

    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
         cards = []
        // dodaj kart parami numberPairsOfCard = 2
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    
    mutating func choose(_ card: Card) {
                let chosenIndex = index(of: card)
                cards[chosenIndex].isFaceUp.toggle()
        
    }
    
    func index(of card: Card) -> Int{
        for index in cards.indices{
            if (cards[index].id == card.id){
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }

    
    struct Card: Equatable, Identifiable{
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
    }
}
