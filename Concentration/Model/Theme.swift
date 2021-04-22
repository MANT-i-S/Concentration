//
//  Theme.swift
//  Concentration
//
//  Created by Serhii Holiak on 4/21/21.
//

import Foundation

struct Theme {
    
    var setOfEmojis : [String]
    
    //Going with random theme every time untill user chose theme for the first time. Then stays with chosen theme.
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
            let options = ["🍎", "🥕", "🚙", "🐆", "🥗"]
            let index = options.count.arc4random
            let randomTheme = options[index]
            switch randomTheme {
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
}
