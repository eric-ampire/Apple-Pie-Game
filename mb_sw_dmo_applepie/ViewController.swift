//
//  ViewController.swift
//  mb_sw_dmo_applepie
//
//  Created by Eric Ampire on 21/10/2018.
//  Copyright © 2018 Eric Ampire. All rights reserved.
//

import UIKit

struct Book {
    var name: String
    var publicationYear: Int?
}

let book = Book(name: "maintrise du ath", publicationYear:  nil)

class ViewController: UIViewController {
    
    var listOfWords = [
        "kotlin", "swift", "programme", "bug", "macbook", "facebook", "java", "twitter", "apple", "microsoft",
        "hackathon", "iphone", "ipad", "applepie", "jeux", "eric", "bigomokero", "finder", "xcode", "android"
    ]
    
    let incorrectMovesAllowed = 7
    
    // if player win, start new round
    var totalWin = 0 {
        didSet {
            newRound()
        }
    }
    
    // if player loose, start new round
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame: Game!

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateStateGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        if listOfWords.isEmpty {
            enableLetterButtons(false)
        } else {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }
    }
    
    func enableLetterButtons(_ isEnable: Bool) {
        for button in letterButtons {
            button.isEnabled = isEnable
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWin), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "tree\(currentGame.incorrectMovesRemaining)")
        
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpace = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpace
    }
    
    func updateStateGame() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.formattedWord == currentGame.word {
            totalWin += 1
        } else {
            updateUI()
        }
    }
}

