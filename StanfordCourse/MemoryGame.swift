//
//  MemoryGame.swift
//  StanfordCourse
//
//  Created by Julio Jean Fils on 25/5/21.
//

// Model 
import Foundation

struct MemoryGame<CardContent> where CardContent  : Equatable {
    private (set) var cards : Array<Card> // list of card
    
    
    private var indexOfTheOneAndOnlyFaceUpCard : Int?
    
    mutating func choose (_ card: Card) {
        
        if  let chosenindex  =
                cards.firstIndex(where:{ $0.id == card.id })  ,
            !cards[chosenindex].isFaceUp  ,
            !cards[chosenindex].isMatch {
            
            // Game logic
            if let potentialMatchindex  = indexOfTheOneAndOnlyFaceUpCard {
                
                if cards[chosenindex].content == cards[potentialMatchindex].content {
                    cards[chosenindex].isMatch = true
                    cards[potentialMatchindex].isMatch = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
                
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                
                indexOfTheOneAndOnlyFaceUpCard = chosenindex
            }
            
            
            cards[chosenindex].isFaceUp.toggle()
        }
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int)-> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in  0..<numberOfPairsOfCards {
            let content : CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card : Identifiable {
        
        var isFaceUp : Bool = false
        var isMatch: Bool = false
        var content : CardContent
        var id:Int
    }
}
