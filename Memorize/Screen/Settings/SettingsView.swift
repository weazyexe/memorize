//
//  SettingsView.swift
//  Memorize
//
//  Created by Timur Zadvornov on 07.12.2020.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var themeId = ThemeSettings.theme.id
    
    private let viewModel = SettingsViewModel()
    
    var body: some View {
        Text("Theme")
        Picker(selection: $themeId, label: Text("Theme")) {
            Text("Red").tag(0)
            Text("Orange").tag(1)
            Text("Blue").tag(2)
        }
        .onChange(of: themeId) {
            viewModel.setTheme(theme: ThemeSettings.themeById(id: $0))
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
