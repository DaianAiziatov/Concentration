//
//  ViewController.swift
//  Concentration
//
//  Created by Daian Aiziatov on 30/10/2018.
//  Copyright © 2018 Daian Aiziatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentartion(numberPairsOfCards: numberPairsOfCards)
    private var cardColor: UIColor?
    
    private var numberPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountsLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var newGameButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        loadTheme()
        updateViewFromModel()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        loadTheme()
        game = Concentartion(numberPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chossen card is not in the cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        flipCountsLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.scorePoints)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : cardColor!
                button.isEnabled = card.isMatched ? false : true
            }
            
        }
    }
    

    private var emojiChoices = [String]()
    private var emoji = [Int : String]()
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    private func loadTheme() {
        let theme = Theme.getRandomTheme()
        cardColor = theme.fontColor
        newGameButtonOutlet.setTitleColor(theme.fontColor, for: UIControl.State.normal)
        emojiChoices = theme.emojiPack
        flipCountsLabel.textColor = theme.fontColor
        scoreLabel.textColor = theme.fontColor
        self.view.backgroundColor = theme.backgroundColor
    }
}

extension Int {
    var arc4random:Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
        
    }
}

