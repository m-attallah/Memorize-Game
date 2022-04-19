//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mohamed Atallah on 18/04/2022.
//

import SwiftUI


// The ViewModel class
class EmojiMemoryGame: ObservableObject {
   
   static let emojis = ["🚔", "🚜", "🚀", "🚁", "🚑", "🚗", "🚙", "🚌", "🏎", "🚎", "🚒", "🚚", "🛺", "🏍", "🚘", "🛵", "✈️", "🚤", "⛴", "🛸", "🚐", "🛻", "🚕", "🚃", "🚖"]
    
   static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = creatMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
