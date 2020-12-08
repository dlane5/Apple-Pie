//
//  ViewController.swift
//  Apple Pie
//
//  Created by Westside Health Authority on 11/29/20.
//

import UIKit

var listOfWords = ["cake", "walking", "animals", "household objects", "love", "bank"]
let incorrectMoveAllowed = 7

var totalWins = 0
var totalLosses = 0

class ViewController: UIViewController {

@IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: . normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }

    
@IBOutlet var letterButtons: [UIButton]!
    
    
    
    
@IBOutlet weak var treeImageView: UIImageView!
@IBOutlet weak var correctWordLabel: UILabel!
@IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    var currentGame: Game!
    
    func newRound () {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMoveAllowed, guessedLetters: [])
        updateUI()
    
}
    func updateUI() {
        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}

