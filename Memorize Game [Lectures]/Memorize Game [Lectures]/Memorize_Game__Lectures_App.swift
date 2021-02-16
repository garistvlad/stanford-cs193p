//
//  Memorize_Game__Lectures_App.swift
//  Memorize Game [Lectures]
//
//  Created by Vladislav Garist on 15.02.2021.
//

import SwiftUI

@main
struct Memorize_Game__Lectures_App: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
