//
//  Const.swift
//  Memorize
//
//  Created by Timur Zadvornov on 06.01.2021.
//

import SwiftUI

let PAIRS_COUNT_RANGE = 2...5

let DEFAULT_PRIMARY_COLOR = Color(red: 255 / 255, green: 93 / 255, blue: 82 / 255)
let DEFAULT_SECONDARY_COLOR = Color(red: 255 / 255, green: 165 / 255, blue: 158 / 255)
let DEFAULT_BACKGROUND_COLOR = Color(red: 255 / 255, green: 203 / 255, blue: 199 / 255)
let DEFAULT_EMOJI_SET = ["😳", "😎", "🗿", "🌚", "🤔"]

let THEMES: [Theme] = [
    Theme(
        id: 0,
        name: "Red",
        primaryColor: DEFAULT_PRIMARY_COLOR,
        secondaryColor: DEFAULT_SECONDARY_COLOR,
        backgroundColor: DEFAULT_BACKGROUND_COLOR,
        emojis: DEFAULT_EMOJI_SET
    ),
    Theme(
        id: 1,
        name: "Orange",
        primaryColor: Color(red: 255 / 255, green: 177 / 255, blue: 82 / 255),
        secondaryColor: Color(red: 255 / 255, green: 201 / 255, blue: 135 / 255),
        backgroundColor: Color(red: 255 / 255, green: 239 / 255, blue: 219 / 255),
        emojis: ["💕", "🎉", "❄️", "🎁", "💨"]
    ),
    Theme(
        id: 2,
        name: "Blue",
        primaryColor: Color(red: 82 / 255, green: 186 / 255, blue: 255 / 255),
        secondaryColor: Color(red: 158 / 255, green: 216 / 255, blue: 255 / 255),
        backgroundColor: Color(red: 235 / 255, green: 247 / 255, blue: 255 / 255),
        emojis: ["🤯", "🤡", "👀", "🧑‍💻", "🐸"]
    )
]
