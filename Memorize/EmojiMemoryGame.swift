//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Elune on 24/7/21.
//
// the view model of MVVM
// the gatekeeper of model

import SwiftUI

// This view model conforms the ObservableObject
// It can publish the change to the world
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
    
    // Anytime model changes, this view model publish the news to the world.
    @Published private var model = createMemoryGame()
    
    // By conforming to ObservableObject, we get a free objectWillChange
    // var objectWillChange: ObservableObjectPublisher
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        // if we add objectWillChange here, anytime users choose a card,
        // this view model publish to the world.
        // objectWillChange.send()
        model.choose(card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
