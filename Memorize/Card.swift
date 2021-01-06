//
//  Card.swift
//  Memorize
//
//  Created by Timur Zadvornov on 06.01.2021.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var emoji: String = "👀"
    var isFaceUp: Bool = false
    var freeze: Bool = false
}
