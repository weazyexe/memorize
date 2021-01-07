//
//  GameViewModel.swift
//  Memorize
//
//  Created by Timur Zadvornov on 06.01.2021.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published
    private(set) var cards: [Card] = []
    
    @Published
    var win = false

    private var game: MemorizeGame? = nil
    
    func initializeGame() {
        win = false
        game = MemorizeGame()
        game?.onWinAction = onWin
        updateCards()
    }
    
    func onTap(card: Card) {
        game?.showCard(card: card)
        updateCards()
    }
    
    func onWin() {
        win = true
    }
    
    private func updateCards() {
        cards = game?.cards ?? []
    }
}
