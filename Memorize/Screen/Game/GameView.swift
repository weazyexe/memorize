//
//  GameView.swift
//  Memorize
//
//  Created by Timur Zadvornov on 07.12.2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject
    var viewModel = GameViewModel()
    
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("Theme: \(ThemeSettings.theme.name)")
            Text("Score: \(viewModel.score)")
                .padding()
            
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.onTap(card: card)
                }
                .padding(5)
            }
            .onAppear(perform: {
                viewModel.initializeGame()
            })
            .alert(isPresented: $viewModel.win, content: {
                Alert(
                    title: Text("Winner winner"),
                    message: Text("Chicken dinner"),
                    primaryButton: .default(Text("Restart")) {
                        viewModel.initializeGame()
                    },
                    secondaryButton: .cancel(Text("Back")) {
                        mode.wrappedValue.dismiss()
                    }
                )
            })
            .foregroundColor(Color.orange)
            .padding()
        }
    }
}

struct CardView: View {
    
    var card: Card
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle (cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle (cornerRadius: cornerRadius)
                    .strokeBorder(ThemeSettings.theme.primaryColor, lineWidth: edgeLineWidth)
                
                Pie(
                    startAngle: Angle.degrees(0 - 90),
                    endAngle: Angle.degrees(110 - 90),
                    clockwise: true
                )
                .fill(ThemeSettings.theme.secondaryColor)
                .padding(5)
                .opacity(0.4)
                
                Text(card.emoji)
            } else {
                RoundedRectangle (cornerRadius: cornerRadius).fill(ThemeSettings.theme.primaryColor)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
