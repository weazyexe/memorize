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
    
    func generateCards() {
        let cardsCount = Int.random(in: PAIRS_COUNT_RANGE)
        var cards: [Card] = []
        
        for _ in 0..<2 {
            for j in 0..<(cardsCount) {
                cards.append(Card(emoji: CARD_EMOJIS[j]))
            }
        }
        
        self.cards = cards.shuffled()
    }
    
    func onTap(card: Card) {
        let position = cards.firstIndex(where: { $0.id == card.id })!
        var tappedCard = cards[position]
        tappedCard.isFaceUp = !tappedCard.isFaceUp
        cards[position] = tappedCard
        // Do nothing
    }
}
