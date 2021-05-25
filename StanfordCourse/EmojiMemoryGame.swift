//
//  EmojiMemoryGame.swift
//  StanfordCourse
//
//  Created by Julio Jean Fils on 25/5/21.
// is VIEW MODEL

import SwiftUI


class EmojiMemoryGame : ObservableObject {
    
    static let emojis : [String] = [
        "😡","🤮 ",
        "👑","😅","😂","🤣","🥲","🧶","😊","😇","😌","😍","🥰","😘","😗","👹","🤡","👻","👽","🤖","🎃","🤨", "😭"];
    
    static func createMemoryGame () -> MemoryGame<String> {
        MemoryGame <String> (numberOfPairsOfCards: 12) {
            pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
        
    }
    
    @Published  private var model : MemoryGame<String> = createMemoryGame()
    
    var cards :  Array<MemoryGame<String>.Card> {
        model.cards
    }
    // Intent
    
    func choose (_ card :MemoryGame<String>.Card ){
        model.choose(card)
    }
    
}

