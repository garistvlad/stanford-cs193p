import SwiftUI


struct ContentView: View {
    var viewModel = EmojiMemoryGame()
    var body: some View {
        GridView(cards: viewModel.cards).padding()
    }
}


struct GridView: View {
    var cards: [Card<String>]
    var useSmallerFont: Bool {
        cards.count > 8
    }
    
    var body: some View {
        HStack {
            ForEach(cards) { card in
                CardView(card: card, useSmallerFont: useSmallerFont).onTapGesture { card.choose() }
            }
        }
    }
}


struct CardView: View {
    var card: Card<String>
    // Task 5. Smaller font possibility
    var useSmallerFont: Bool
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 5).fill(Color.white)
                RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 3)
                if useSmallerFont {
                    Text(card.content).font(Font.body)
                } else {
                    Text(card.content).font(Font.largeTitle)
                }
                
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
        // Task 3: Width to Height ratio
        .aspectRatio(2.0 / 3.0, contentMode: ContentMode.fit)
        .foregroundColor(Color.orange)
    }
}

















































// Proview information
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
