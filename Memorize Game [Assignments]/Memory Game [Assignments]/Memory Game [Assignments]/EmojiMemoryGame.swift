// ViewModel is here

import Foundation

struct EmojiMemoryGame {
    // Task 4: Random number of pairs of cards
    var model: MemoryGame<String> = createMemoryGame(numberOfPaisOfCars: Int.random(in: 2...5))
    
    static func createMemoryGame(numberOfPaisOfCars: Int) -> MemoryGame<String> {
        // Task Extra: generate randomly from bigget set of Emojies
        let emojiSet = ["👻", "🧟‍♂️", "🕷", "🎃", "🧛‍♂️", "🧙‍♂️", "🙀", "🕸", "💀", "👺"].shuffled()
        return MemoryGame<String>(numberOfPaisOfCars: numberOfPaisOfCars) { pairIndex in
            emojiSet[pairIndex]
        }
    }
    
    var cards: [Card<String>] {
        return model.cards
    }
    
    mutating func choose(card: inout Card<String>) {
        model.choose(card: &card)
    }
}
