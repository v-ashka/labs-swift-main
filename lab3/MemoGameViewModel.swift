//
//  MemoGameViewModel.swift
//  lab3
//
//  Created by student on 07/11/2023.
//


// View Model
import Foundation
import SwiftUI      

class MemoGameViewModel: ObservableObject{
    public static var emojis = [""]
    static let emojisThemeFirst = ["😄", "😅", "🤒", "😱", "😡", "🤩", "👽"]
    
//    static let emojisThemeSecond = ["🐵", "🐶", "🐹", "🐮","🐦", "🐣", "🦎"]
//    
//    static let emojisThemeThird = ["🍎", "🧅", "🍕", "🍔", "🥕", "🧀", "🍅"]
        
    private static func createMemoGame() -> MemoGameModel<String> {
        emojis = emojisThemeFirst
          return MemoGameModel<String>(
            numberOfPairsOfCards: 10, cardContentFactory: {
              index in
              if emojis.indices.contains(index) {
                  return emojis[index]
              }
              return "??"
            }, emojiArr: emojis)
          
      }
      
      func shuffle(){
          model.shuffle()
      }
      
      @Published private var model = MemoGameViewModel.createMemoGame()
      
    
      var cards: Array<MemoGameModel<String>.Card>{
          return model.cards
      }
      
    func choose(_ card: MemoGameModel<String>.Card){
          model.choose(card)
      }
    
    var themeColor = Color.blue
    
    func changeApplicationTheme(color: Color, newEmojis: [String]){
        themeColor = color
        let pairNum = Int.random(in:4...10)
        model.rebuildTheme(newEmojis: newEmojis, numberOfPairsOfCards: pairNum)
//        return MemoGameModel<String>(
//            numberOfPairsOfCards: 10, cardContentFactory: {
//            index in
//            if newEmojis.indices.contains(index) {
//                return newEmojis[index]
//            }
//            return "??"
//          }, emojiArr: newEmojis)
        
//        model.cards = ["D", "F", "G", "C", "D"]
    }
    
    func changeCardTheme(_ card: MemoGameModel<String>.Card){
            
        
    }
    
}
