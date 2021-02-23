// Model is here
import Foundation


struct MemoryGame<CardContent: Equatable> {
    var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        // random order of cards:
        cards.shuffle()
    }
    
    // inout
    mutating func choose(card: Card) {
        if let chosenIndex = self.index(of: card) {
            print("card chosen: \(card)")
            self.cards[chosenIndex].isFacedUp = !self.cards[chosenIndex].isFacedUp
        } else {
            print("can't find card: \(card) among cards: \(self.cards)")
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return nil // TODO: bogus
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFacedUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent // generic
    }
}
