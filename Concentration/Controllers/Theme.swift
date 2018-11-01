//
//  Theme.swift
//  Concentration
//
//  Created by Daian Aiziatov on 31/10/2018.
//  Copyright © 2018 Daian Aiziatov. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    private(set) var emojiPack: [String]
    private(set) var fontColor: UIColor
    private(set) var backgroundColor: UIColor
    
    static func getRandomTheme() -> Theme {
        var themes = [Theme]()
        //should add at least 8 different emoji for 16 cards
        themes.append(Theme(emojiPack: ["🎃", "🍎", "😱", "👻", "🦇", "😈", "🙀", "🍭", "🍬", "💀"], fontColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))) //helloween
        themes.append(Theme(emojiPack: ["🐶", "🐱", "🐭", "🐰", "🐸", "🐵", "🐼", "🐨"], fontColor: #colorLiteral(red: 0.5456555806, green: 0.54051408, blue: 0.06726270228, alpha: 1), backgroundColor: #colorLiteral(red: 0.2314120944, green: 0.4130810248, blue: 0.1076663471, alpha: 1))) //animals
        themes.append(Theme(emojiPack: ["🎋", "🌸", "🌹", "🌻", "🍁", "☘️", "🌵", "🌾"], fontColor: #colorLiteral(red: 0.5456555806, green: 0.2548589459, blue: 0.2273034033, alpha: 1), backgroundColor: #colorLiteral(red: 0.2314120944, green: 0.4130810248, blue: 0.1076663471, alpha: 1))) //plants
        themes.append(Theme(emojiPack: ["🥩", "🍗", "🌭", "🍔", "🍟", "🍕", "🥪", "🌯"], fontColor: #colorLiteral(red: 0.5456555806, green: 0.54051408, blue: 0.06726270228, alpha: 1), backgroundColor: #colorLiteral(red: 0.5456555806, green: 0.2548589459, blue: 0.2273034033, alpha: 1))) // food
        themes.append(Theme(emojiPack: ["⚽️", "🏀", "🏈", "🎾", "⚾️", "🏐", "🏉", "🎱"], fontColor: #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1), backgroundColor: #colorLiteral(red: 0.2314120944, green: 0.4130810248, blue: 0.1076663471, alpha: 1))) // balls
        themes.append(Theme(emojiPack: ["🗿", "🗽", "🗼", "🏰", "🏯", "🏟", "🎡", "🎢"], fontColor: #colorLiteral(red: 0.1118838039, green: 0.2662242594, blue: 0.2800900667, alpha: 1), backgroundColor: #colorLiteral(red: 0.2179656805, green: 0.5186430014, blue: 0.5456555806, alpha: 1))) // treveling
        let randomIndex = Int(arc4random_uniform(UInt32(themes.count)))
        return themes[randomIndex]
    }
    
    private init(emojiPack: [String], fontColor: UIColor, backgroundColor: UIColor) {
        self.emojiPack = emojiPack
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
    }
}
