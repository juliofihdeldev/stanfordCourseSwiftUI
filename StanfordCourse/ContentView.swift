//
//  ContentView.swift
//  StanfordCourse
//
//  Created by Julio Jean Fils on 22/5/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject  var viewModel : EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns:
                            [GridItem(.adaptive(minimum: 65))]){
                    ForEach( viewModel.cards) {
                        card in
                        CardView( card : card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.blue)
            Spacer()
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
}

struct CardView : View {
    
    let card  : MemoryGame<String>.Card
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius:20)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.content).font(.largeTitle)
                
            }
            else if card.isMatch {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}








































struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let game  =  EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
        }
    }
}

