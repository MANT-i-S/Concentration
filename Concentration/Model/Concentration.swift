//
//  Concentration.swift
//  Concentration
//
//  Created by Serhii Holiak on 4/18/21.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    
    private(set) var flipCount = 0
    
    private(set) var gameScore = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    private var endOfTurnDate = Date().timeIntervalSinceReferenceDate
    
    //Matches cards, keeping score, flip count
    //Score Depends on 2 factors. How long each turn take, and how often you pick card you've seen already.
    func chooseCard(at index: Int) {
        let penalty = Int(Date().timeIntervalSinceReferenceDate - endOfTurnDate)
        
        assert(cards.indices.contains(index), "Concentration.choseCard(at: \(index)): chosen index not in the cards")
        
        if cards[index].isFaceUp == false, cards[index].isMatched == false {
            flipCount += 1
            gameScore += -penalty
            endOfTurnDate = Date().timeIntervalSinceReferenceDate
        }
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    gameScore += 20
                    cards[index].isSeen = false
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
            if cards[index].isSeen, indexOfOneAndOnlyFaceUpCard != index {
                gameScore += -10
            }
        }
        cards[index].isSeen = true
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}

// Usend in indexOfOneAndOnlyFaceUpCard
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
