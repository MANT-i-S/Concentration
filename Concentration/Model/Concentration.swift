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
    
    private(set) var gameScore = 0 //TODO implement gamescore with memory of cards you've seen already.
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    //Matches cards, keeping score, flip count
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.choseCard(at: \(index)): chosen index not in the cards")
        if cards[index].isFaceUp == false, cards[index].isMatched == false {
            flipCount += 1
        }
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    gameScore += 2
                    cards[index].isSeen = false
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
            if cards[index].isSeen {
                gameScore += -1
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
