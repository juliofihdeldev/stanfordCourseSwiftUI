//
//  StanfordCourseApp.swift
//  StanfordCourse
//
//  Created by Julio Jean Fils on 22/5/21.
//

import SwiftUI

@main
struct StanfordCourseApp: App {
    let game  =  EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
