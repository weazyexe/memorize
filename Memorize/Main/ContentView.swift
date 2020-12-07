//
//  ContentView.swift
//  Memorize
//
//  Created by Timur Zadvornov on 07.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                TitleView()
                Buttons()
            }
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Welcome to Memorize")
                .fontWeight(.bold)
                .font(.system(size: 24))
            Text("A memory training game")
        }
        .padding(.bottom, 32)
    }
}

struct Buttons: View {
    var body: some View {
        VStack(spacing: 24) {
            NavigationLink(destination: GameView()) {
                Text("Start game")
            }
            
            NavigationLink(destination: SettingsView()) {
                Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
