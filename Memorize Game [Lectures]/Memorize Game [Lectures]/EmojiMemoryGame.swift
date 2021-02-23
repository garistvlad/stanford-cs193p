// ViewModel is here
import SwiftUI


class EmojiMemoryGame: ObservableObject {
    // make model inaccessable for the outside world:
    // @Published is not enough to make it observable from View. Just mark viewModel as @ObservedObject
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // 'static' because should be called before an initialization
    static func createMemoryGame() -> MemoryGame<String> {
        let emojiSet: Array<String> = ["🎃", "👻", "🧙‍♂️", "🧟‍♂️", "🧛‍♂️", "🕷"]
        // then initalize with contentFactory:
        return MemoryGame<String>(numberOfPairOfCards: 3) { pairIndex in
            return emojiSet[pairIndex % emojiSet.count]
        }
    }
    
    // No need to define, we already get it for free via "ObservableObject" : var objectWillChange: ObservableObjectPublisher
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        // no need for this: objectWillChange.send(), just use @Published wrapper for overall model
        model.choose(card: card)
    }
}
