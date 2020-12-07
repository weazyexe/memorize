//
//  ContentView.swift
//  Memorize
//
//  Created by Timur Zadvornov on 07.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TitleView()
            Buttons()
        }
    }
}

struct TitleView: View {
    var body: some View {
        Text("Welcome to Memorize")
            .fontWeight(.bold)
            .font(.system(size: 24))
        Text("A memory training game")
            .padding(.bottom, 32)
    }
}

struct Buttons: View {
    var body: some View {
        Button("Start game", action: {
            
        })
        .padding()
        
        Button("Settings", action: {
            
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
