//
//  ThemeManager.swift
//  Memorize
//
//  Created by Timur Zadvornov on 07.01.2021.
//

import Foundation
import SwiftUI

class ThemeSettings {
    
    static var theme: Theme = THEMES[0]
    
    static func themeById(id: Int) -> Theme {
        return THEMES.first(where: { $0.id == id })!
    }
}
