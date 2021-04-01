//
//  MemorizeApp.swift
//  Memorize
//
//  Created by SeoYeon Hong on 2021/03/30.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
