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
        print("newbutton pressed")
        //TODO pretty sure there is an efficient way to reset the game. Deinitialize game and initialize new one, but how? xD
    }
    
    @IBAction func themeMenu(_ sender: UIButton) {
        let themeOptions = ["🍎", "🥕", "🚙", "🐆", "🥗"]
        for index in themeButtons.indices{
            themeButtons[index].setTitle(themeOptions[index], for: .normal)
            //TODO move stack view to the front layer when pressed once. Make it desapear and move to back layer if pressed second time.
        }
    }
    
    @IBOutlet var themeButtons: [UIButton]!
    
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
    
    var themeChoise = "vegetables" //TODO Recieve this from user
    
    private var themeDictionary = ["fruits": ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑"], "vegetables": ["🍆", "🍅", "🥑", "🥦", "🥬", "🥒", "🌶", "🫑", "🧄", "🍠", "🥕", "🥔", "🧅"], "vehicles": ["🚗", "🚌", "🚕", "🚙", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚜"], "animals": ["🐆", "🦓", "🦍", "🦧", "🦛", "🐘", "🦏", "🐪", "🦒", "🦘", "🐄", "🐏", "🐕"], "food": ["🥗", "🥘", "🌮", "🍔", "🍟", "🍕", "🫔", "🌯", "🍱", "🥟", "🥧", "🍰", "🍩"]]
    
    // TODO Give player option to chose between different sets of emojis and make it "public" probably
    private var emoji = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, themeDictionary[themeChoise]!.count > 0 {
            emoji[card.identifier] = themeDictionary[themeChoise]!.remove(at: themeDictionary[themeChoise]!.count.arc4random) //I don't think I should force unwrap in this function but lets make an exception this time xD.
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
