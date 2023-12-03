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
    private(set) var points: Int
    
    init(points: Int, numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
         cards = []
        self.points = points
        // dodaj kart parami numberPairsOfCard = 2
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            cards.indices.filter{index in cards[index].isFaceUp}.only
        }
        
        set{
            return cards.indices.forEach{
                cards[$0].isFaceUp = (newValue == $0)
            }
        }
    }
    
    
    mutating func choose(_ card: Card) {
//                let chosenIndex = index(of: card)
//                cards[chosenIndex].isFaceUp.toggle()
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchedIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                        points+=4
                    }else{
                        if cards[chosenIndex].hasBeenSeen{
                            points-=1
                        }
                    }
                }else{
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
        
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
//        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var hasBeenSeen = false
        var id: String
        
        var isFaceUp = false {
         didSet {
             if oldValue && !isFaceUp {
                 hasBeenSeen = true
                 
             }
          }
        }
    }
}

extension Array{
    var only: Element? {
        count == 1 ? first : nil
    }
}
