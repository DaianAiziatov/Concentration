//
//  Card.swift
//  Concentration
//
//  Created by Daian Aiziatov on 30/10/2018.
//  Copyright © 2018 Daian Aiziatov. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var hashValue:Int { return identifier }
    
    var isFacedUp = false
    var isMatched = false
    var wasMismatched = false
    private var identifier: Int
    
    init() {
        self.identifier = Card.getUniqIdentifier()
    }
    
    
    private static var identifierFactory = 0;
    
    private static func getUniqIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    
}
