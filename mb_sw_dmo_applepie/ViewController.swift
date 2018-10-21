//
//  ViewController.swift
//  mb_sw_dmo_applepie
//
//  Created by Eric Ampire on 21/10/2018.
//  Copyright © 2018 Eric Ampire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["kotlin", "swift", "programme", "bug", "macbook"]
    let incorrectMovesAllowed = 7
    var totalWin = 0
    var totalLosses = 0
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
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWin), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "tree\(currentGame.incorrectMovesRemaining)")
    }
}

