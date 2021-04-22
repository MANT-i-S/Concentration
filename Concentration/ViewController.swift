//
//  ViewController.swift
//  Concentration
//
//  Created by Serhii Holiak on 4/18/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2 //almost sure 'return' is unnessesary here but keep it for now.
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in carButtons")
        }
    }
    
    @IBAction private func newGameButton(_ sender: UIButton) {
        print("newbutton pressed") //TODO remove this.
        game.resetGame()
        resetUIView()
    }
    
    private func resetUIView() {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        theme = Theme(chosen: themeChosen) //change for variable
        updateViewFromModel()
    }
    
    var themeChosen = "🥕"
    
    lazy private var theme = Theme(chosen: themeChosen)
    
    @IBOutlet private weak var themeMenuSubView: UIStackView!
    
    @IBAction private func themeMenuOperator(_ sender: UIButton) {
        
        if sender.currentTitle == "⇧" {
            let themeOptions = ["🍎", "🥕", "🚙", "🐆", "🥗"]
            view.bringSubviewToFront(themeMenuSubView)
            for index in themeButtons.indices {
                themeButtons[index].setTitle(themeOptions[index], for: .normal)
            }
            sender.setTitle("⇣", for: .normal)
        } else {
            view.sendSubviewToBack(themeMenuSubView)
            for index in themeButtons.indices {
                themeButtons[index].setTitle("", for: .normal)
            }
            sender.setTitle("⇧", for: .normal)
        }
    }
    
    @IBOutlet private var themeButtons: [UIButton]!
    
    @IBAction private func themeOptions(_ sender: UIButton) {
        if let indexOfTheButton = themeButtons.firstIndex(of: sender) {
            print("button \(themeButtons[indexOfTheButton].titleLabel!.text!) pressed") // TODO remove this.
            if let tempButton = themeButtons[indexOfTheButton].titleLabel, let tempChoise = tempButton.text {
                themeChosen = tempChoise
                theme = Theme(chosen: themeChosen)
                game.resetGame()
                resetUIView()
            }
        }
    }
    
    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(game.flipCount)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
            }
        }
    }
    
    private var emoji = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, theme.setOfEmojis.count > 0 {
            emoji[card.identifier] = theme.setOfEmojis.remove(at: theme.setOfEmojis.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self)))) //'-Int(arc4random_uniform(UInt32(abs(self))))' in lecture example but I don't think it's correct.
        } else {
            return 0
        }
    }
}
