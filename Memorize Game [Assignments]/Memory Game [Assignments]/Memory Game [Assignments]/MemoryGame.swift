// Model is here

import Foundation


struct MemoryGame<CardContent> {
    let numberOfPaisOfCars: Int
    var cards: [Card<CardContent>]
    
    init(numberOfPaisOfCars: Int, cardContentFactory: (Int) -> CardContent) {
        self.numberOfPaisOfCars = numberOfPaisOfCars
        cards = [Card<CardContent>]()
        for i in 0..<self.numberOfPaisOfCars {
            let content = cardContentFactory(i)
            let cardOne = Card(id: 2 * i, content: content)
            let cardTwo = Card(id: 2 * i + 1, content: content)
            cards.append(cardOne)
            cards.append(cardTwo)
        }
        // Task 2. Shuffled cards
        cards.shuffle()
    }
    
    func choose(card: inout Card<CardContent>) {
        card.choose()
    }
}


struct Card<CardContent>: Identifiable {
    let id: Int
    let content: CardContent
    var isFaceUp: Bool = true
    
    func choose() {
        // self.isFaceUp = !self.isFaceUp
        print("Card parameters was changed. Now isFaceUp = \(self.isFaceUp)")
    }
}
