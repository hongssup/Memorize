//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by SeoYeon Hong on 2021/03/31.
//

// ViewModel (UI는 View에서 하고 여기서 직접 하지는 않지만 어떻게 display할 지 등을 받아와야하기 때문에 UI를 import해줌)
import SwiftUI

//func createCardContent(pairIndex: Int) -> String {
//    return "😄"
//}     closure로 선언해주기

// ViewModel as a class (easy to share)
class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(S)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
