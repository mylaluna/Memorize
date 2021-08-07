//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Elune on 19/5/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // EmojiMemoryGame is a class/reference type
    // so the reference can be a constant and its content can still vary
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}

struct MemorizeApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
