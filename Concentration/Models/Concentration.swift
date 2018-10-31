//
//  Concentration.swift
//  Concentration
//
//  Created by Daian Aiziatov on 30/10/2018.
//  Copyright © 2018 Daian Aiziatov. All rights reserved.
//

import Foundation

class Concentartion {
    
    var cards = Array<Card>()
    var flipCount = 0
    var scorePoints = 0
    var indexOfOneAndOnlyOneFacedUpCard: Int?
    
    func chooseCard(at index: Int) {
        flipCount += 1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFacedUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
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
                indexOfOneAndOnlyOneFacedUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
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