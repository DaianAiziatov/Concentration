//
//  Concentration.swift
//  Concentration
//
//  Created by Daian Aiziatov on 30/10/2018.
//  Copyright © 2018 Daian Aiziatov. All rights reserved.
//

import Foundation

struct Concentartion {
    
    private(set) var cards = Array<Card>()
    
    private(set) var flipCount = 0
    private(set) var scorePoints = 0
    private var indexOfOneAndOnlyOneFacedUpCard: Int? {
        get {
            return cards.indices.filter {cards[$0].isFacedUp}.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue )
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        flipCount += 1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFacedUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    scorePoints += 2
                } else {
                    if cards[matchIndex].wasMismatched {
                        scorePoints -= 1
                    }
                    if cards[index].wasMismatched {
                        scorePoints -= 1
                    }
                    cards[matchIndex].wasMismatched = true
                    cards[index].wasMismatched = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfOneAndOnlyOneFacedUpCard = index
            }
        }
    }
    
    init(numberPairsOfCards: Int) {
        flipCount = 0
        scorePoints = 0
        for _ in 1...numberPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
