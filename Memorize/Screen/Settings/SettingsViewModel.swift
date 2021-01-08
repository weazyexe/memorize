//
//  SettingsViewModel.swift
//  Memorize
//
//  Created by Timur Zadvornov on 08.01.2021.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published
    private(set) var currentTheme: Theme = ThemeSettings.theme
    
    func setTheme(theme: Theme) {
        ThemeSettings.theme = theme
        currentTheme = theme
    }
}
