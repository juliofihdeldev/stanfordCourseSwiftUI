//
//  ContentView.swift
//  StanfordCourse
//
//  Created by Julio Jean Fils on 22/5/21.
//

import SwiftUI

struct ContentView: View {
    
    let emojis : [String] = [
        "😡","🤮 ",
        "👑","😅","😂","🤣","🥲","🧶","😊","😇","😌","😍","🥰","😘","😗","👹","🤡","👻","👽","🤖","🎃","🤨", "😭"];
    
    @State var emojiCount = 8
    
    
    var add: some View {
        Button(action: {
            
            if emojiCount < emojis.count {
                emojiCount += 1;
            }
        }, label: {
            VStack{
                Image( systemName:"plus.circle")
            }
        })
    }
    
    
    var remove : some View{
        Button(action: {
            
            if emojiCount > 1 {
                emojiCount -= 1;
            }
            
        }, label: {
            VStack{
                Image( systemName:"minus.circle")
            }
        })
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns:
                            [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id:\.self,  content:{ emoji in
                        CardView( content: emoji).aspectRatio(2/3,contentMode: .fit)
                    })
                }
                
            }
            .foregroundColor(.blue)
            Spacer()
            
            HStack(){
                add
                Spacer()
                remove
                
            }.font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
    
    
}



struct CardView : View {
    @State var isFaceUp  : Bool = true ;
    var content : String
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius:20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
                
            } else {
                shape.fill()
            }
        }.onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}








































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

