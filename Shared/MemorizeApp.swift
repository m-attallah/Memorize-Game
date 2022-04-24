//
//  MemorizeApp.swift
//  Shared
//
//  Created by Mohamed Atallah on 08/04/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
