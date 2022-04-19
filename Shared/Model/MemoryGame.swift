//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mohamed Atallah on 18/04/2022.
//

import Foundation

// The Model struct
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("chosenCard \(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, creatCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numeberOfPairsOfCards x 2 cards to cards array.
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = creatCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        var id: Int

    }
}
