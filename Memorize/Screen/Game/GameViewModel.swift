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
    private(set) var score: Int = 0
    
    @Published
    var win = false

    private var game: MemorizeGame? = nil
    
    func initializeGame() {
        win = false
        game = MemorizeGame()
        game?.onWinAction = onWin
        updateView()
    }
    
    func onTap(card: Card) {
        game?.showCard(card: card)
        updateView()
    }
    
    func onWin() {
        win = true
    }
    
    private func updateView() {
        cards = game?.cards ?? []
        score = game?.score ?? 0
    }
}
