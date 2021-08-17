//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Elune on 19/5/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    // this a calculated variable from a return of function
    // view model named game
    // anytime view model changes, this view redraws
    @ObservedObject var game: EmojiMemoryGame
    
    // the content of this var body is interpretted by @ViewBuilder
    // to A LIST OF VIEWS and combined into one
    // the return result conforms to View
    // @ViewBuilder can also be used to mark a parameter of a function
    // parameter type "a function that returns a View"
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            // following can be converted to be a function returns a ViewBuilder
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
//    @ViewBuilder
//    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
//        if card.isMatched && !card.isFaceUp {
//            Rectangle().opacity(0)
//        } else {
//            CardView(card: card)
//                .padding(4)
//                .onTapGesture {
//                    game.choose(card)
//                }
//        }
//    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        // use GeometryReader to obtain the offered space which is then passed by geometry
        // use the geometry.size to give the emojis adjustable sizes
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(5)
                    .opacity(0.5) // TODO: put magic numbers to constants
                Text(card.content)
                    .font(font(in: geometry.size))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.70
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
