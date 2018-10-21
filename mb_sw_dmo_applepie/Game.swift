//
//  Game.swift
//  mb_sw_dmo_applepie
//
//  Created by Eric Ampire on 21/10/2018.
//  Copyright © 2018 Eric Ampire. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord.append(letter)
            } else {
                guessedWord.append("_")
            }
        }
        
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        
        // if the word doesn't contains the letter
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
