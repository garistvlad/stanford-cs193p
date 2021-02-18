// ViewModel is here
import SwiftUI


class EmojiMemoryGame {
    // make model inaccessable for the outside world:
    private var model: MemoryGame<String> = createMemoryGame()
    
    // 'static' because should be called before an initialization
    static func createMemoryGame() -> MemoryGame<String> {
        let emojiSet: Array<String> = ["🎃", "👻", "🧙‍♂️", "🧟‍♂️", "🧛‍♂️", "🕷"]
        // then initalize with contentFactory:
        return MemoryGame<String>(numberOfPairOfCards: 3) { pairIndex in
            return emojiSet[pairIndex % emojiSet.count]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
