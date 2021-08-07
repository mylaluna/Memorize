//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Elune on 24/7/21.
//
// the view model of MVVM
// the gatekeeper of model

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let vehicleEmojis = ["🚍", "🚠", "🚄", "✈️", "🚀",
                         "🛸", "🛳", "🚁", "🚓", "🛴"]
    private static let foodEmojis = ["🍔", "🍕", "🍖", "🎂", "🍭",
                      "🍿", "🥟", "🍜", "🍎", "🍒",
                      "🌶", "🍉", "🍌"]
    
    private static let emojis = ["🐰", "🐈", "🐶", "🐮", "🐷",
                        "🐏", "🐔", "🐟", "🐼", "🐴",
                        "🐭", "🐯", "🐬", "🦉", "🐍", "🐘"]
    
    // type function (global): static keyword attachs the function to the type
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
