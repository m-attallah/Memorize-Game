//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mohamed Atallah on 18/04/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚔", "🚜", "🚀", "🚁", "🚑", "🚗", "🚙", "🚌", "🏎", "🚎", "🚒", "🚚", "🛺", "🏍", "🚘", "🛵", "✈️", "🚤", "⛴", "🛸", "🚐", "🛻", "🚕", "🚃", "🚖"]
    
    
   private static func creatMemoryGame() -> MemoryGame<String> {
       MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
           emojis[pairIndex]
       }
    }
    
    @Published private var model = creatMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }

}
