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
    private(set) var win = false

    private var openedCardsCount: Int = 0
    
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
        if (!card.freeze) {
            if openedCardsCount == 2 {
                checkOpenedCards()
                
                if checkWin() {
                    self.win = true
                } else {
                    for i in 0..<(cards.count) {
                        if (!cards[i].freeze) {
                            cards[i].isFaceUp = false
                        }
                    }
                }
                openedCardsCount = 0
            }
            
            let position = cards.firstIndex(where: { $0.id == card.id })!
            var tappedCard = cards[position]
            tappedCard.isFaceUp = !tappedCard.isFaceUp
            cards[position] = tappedCard
            
            openedCardsCount += 1
        }
    }
    
    private func checkOpenedCards() {
        let openedCards = cards.filter { $0.isFaceUp && !$0.freeze }
        
        let firstIndex = cards.firstIndex { $0.id == openedCards[0].id }!
        let secondIndex = cards.firstIndex { $0.id == openedCards[1].id }!
        
        if (cards[firstIndex].emoji == cards[secondIndex].emoji) {
            cards[firstIndex].freeze = true
            cards[secondIndex].freeze = true
        }
    }
    
    private func checkWin() -> Bool {
        return cards.allSatisfy { $0.freeze }
    }
}
