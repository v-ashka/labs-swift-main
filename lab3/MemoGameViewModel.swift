//
//  MemoGameViewModel.swift
//  lab3
//
//  Created by student on 07/11/2023.
//


// View Model
import Foundation
import SwiftUI      

// Obserwowana klasa
class MemoGameViewModel: ObservableObject{
    static let emojisThemeFirst = ["😄", "😅", "🤒", "😱", "😡", "🤩", "👽"]
    static let emojisThemeSecond = ["🐵", "🐶", "🐹", "🐮","🐦", "🐣", "🦎"]
    static let emojisThemeThird = ["🍎", "🧅", "🍕", "🍔", "🥕", "🧀", "🍅"]
    var themeColor = Color.blue
    
    private static var themes = [1: (4, emojisThemeFirst),
                                   2: (6, emojisThemeSecond),
                                   3: (8, emojisThemeThird)]
        
    private static func createMemoGame(_ theme: Int) -> MemoGameModel<String> {
        let count = themes[theme]!.0
        let emojis = themes[theme]!.1
        let points = 0
          return MemoGameModel<String>(
            points: points, numberOfPairsOfCards: count, cardContentFactory: {
              index in
              if emojis.indices.contains(index) {
                  return emojis[index]
              }
              return "??"
            })
          
      }
      
      func shuffle(){
          model.shuffle()
      }
      
//    W przypadku zmiany, dochodzi do powiadomienia
      @Published private var model = MemoGameViewModel.createMemoGame(1)
      
    
      var cards: Array<MemoGameModel<String>.Card>{
          return model.cards
      }
    
    var points: Int{
        return model.points
    }
      
    func choose(_ card: MemoGameModel<String>.Card){
          model.choose(card)
      }
    
   
    
    func changeApplicationTheme(color: Color, themeNum: Int){
        themeColor = color
        model = MemoGameViewModel.createMemoGame(themeNum)
    }
    
}
