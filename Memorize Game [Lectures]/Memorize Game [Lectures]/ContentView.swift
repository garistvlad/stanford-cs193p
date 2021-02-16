import SwiftUI


struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        // return is not necessarily
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFacedUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}






































































// Just to see a preview:
struct ContentView_Previews: PreviewProvider {
    static var game = EmojiMemoryGame()
    
    static var previews: some View {
        ContentView(viewModel: game)
    }
}
