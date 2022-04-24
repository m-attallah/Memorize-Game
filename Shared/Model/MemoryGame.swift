//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mohamed Atallah on 18/04/2022.
//

import Foundation

struct MemoryGame<cardContent> where cardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUPCard: Int? {
        get { cards.indices.filter ({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    
    //add: GAME LOGIC
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
                            !cards[chosenIndex].isFaceUp,
                            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUPCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true

            } else {
                indexOfTheOneAndOnlyFaceUPCard = chosenIndex
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int, creatCardContent: (Int) -> cardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = creatCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: cardContent
        let id: Int
    }
}


extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
