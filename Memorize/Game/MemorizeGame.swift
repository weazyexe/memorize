//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Timur Zadvornov on 07.01.2021.
//

import Foundation

class MemorizeGame {
    
    var onWinAction: () -> Void = {}
    
    var score: Int = 0
    
    private(set) var cards: [Card] = []
    
    private var openedCardsCount: Int = 0
    
    init() {
        self.cards = generateCards().shuffled()
    }
    
    func showCard(card: Card) {
        if (!card.freeze) {
            if openedCardsCount == 0 {
                hideNotFreezedCards()
            }
            
            faceCardUp(card: card)
            openedCardsCount += 1
            
            if openedCardsCount == 2 {
                freezeCardIfTheyAreEqual()
                
                if checkWin() {
                    onWinAction()
                }
                
                openedCardsCount = 0
            }
        }
    }
    
    private func generateCards() -> [Card] {
        let cardsCount = Int.random(in: PAIRS_COUNT_RANGE)
        var cards: [Card] = []
        
        for _ in 0..<2 {
            for j in 0..<(cardsCount) {
                cards.append(Card(emoji: CARD_EMOJIS[j]))
            }
        }
        return cards
    }
    
    private func hideNotFreezedCards() {
        for i in 0..<(cards.count) {
            if (!cards[i].freeze) {
                cards[i].isFaceUp = false
            }
        }
    }
    
    private func faceCardUp(card: Card) {
        let position = cards.firstIndex(matching: card)!
        var tappedCard = cards[position]
        
        tappedCard.isFaceUp = !tappedCard.isFaceUp
        
        cards[position] = tappedCard
    }
    
    private func freezeCardIfTheyAreEqual() {
        let openedCards = cards.filter { $0.isFaceUp && !$0.freeze }
        
        let firstIndex = cards.firstIndex(matching: openedCards[0])!
        let secondIndex = cards.firstIndex(matching: openedCards[1])!
        
        if cards[firstIndex].emoji == cards[secondIndex].emoji {
            cards[firstIndex].freeze = true
            cards[secondIndex].freeze = true
            score += 2
        } else {
            decrementScore(
                firstIndex: firstIndex,
                secondIndex: secondIndex
            )
        }
        
        cards[firstIndex].showed = true
        cards[secondIndex].showed = true
    }
    
    private func checkWin() -> Bool {
        return cards.allSatisfy { $0.freeze }
    }
    
    private func decrementScore(firstIndex: Int, secondIndex: Int) {
        if cards[firstIndex].showed && cards[secondIndex].showed {
            score -= 2
        } else if cards[firstIndex].showed || cards[secondIndex].showed {
            score -= 1
        }
    }
}
