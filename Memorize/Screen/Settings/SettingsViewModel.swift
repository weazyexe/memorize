//
//  SettingsViewModel.swift
//  Memorize
//
//  Created by Timur Zadvornov on 08.01.2021.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    func setTheme(theme: Theme) {
        ThemeSettings.theme = theme
    }
}
