//
//  Card.swift
//  Concentration
//
//  Created by Daian Aiziatov on 30/10/2018.
//  Copyright © 2018 Daian Aiziatov. All rights reserved.
//

import Foundation

struct Card {
    
    var isFacedUp = false
    var isMatched = false
    var wasMismatched = false
    var identifier: Int
    
    private static var identifierFactory = 0;
    
    private static func getUniqIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqIdentifier()
    }
    
    
}
