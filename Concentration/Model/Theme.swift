//
//  Theme.swift
//  Concentration
//
//  Created by Serhii Holiak on 4/21/21.
//

import Foundation

struct Theme {
    
    var setOfEmojis : [String]
    
    init(chosen theme: String){
        switch theme {
        case "🍎":
            setOfEmojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑"]
        case "🥕":
            setOfEmojis = ["🍆", "🍅", "🥑", "🥦", "🥬", "🥒", "🌶", "🫑", "🧄", "🍠", "🥕", "🥔", "🧅"]
        case "🚙":
            setOfEmojis = ["🚗", "🚌", "🚕", "🚙", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚜"]
        case "🐆":
            setOfEmojis = ["🐆", "🦓", "🦍", "🦧", "🦛", "🐘", "🦏", "🐪", "🦒", "🦘", "🐄", "🐏", "🐕"]
        case "🥗":
            setOfEmojis = ["🥗", "🥘", "🌮", "🍔", "🍟", "🍕", "🫔", "🌯", "🍱", "🥟", "🥧", "🍰", "🍩"]
        default:
            setOfEmojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑"]
        }
    }
}
