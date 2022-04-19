//
//  MemorizeApp.swift
//  Shared
//
//  Created by Mohamed Atallah on 08/04/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
