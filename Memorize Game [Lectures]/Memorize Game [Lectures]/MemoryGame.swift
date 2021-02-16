// Model is here
import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, isFacedUp: true, isMatched: false, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, isFacedUp: true, isMatched: false, content: content))
        }
    }
    
    func choose(card: Card) {
        // card.choose()
        print("Card \(card) was changed. Now isFacedUp became \(card.isFacedUp)")
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFacedUp: Bool
        var isMatched: Bool
        var content: CardContent // generic
        
        mutating func choose() {
            self.isFacedUp = !self.isFacedUp
        }
    }
}
