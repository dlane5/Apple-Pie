//
//  ViewController.swift
//  Apple Pie
//
//  Created by Westside Health Authority on 11/29/20.
//

import UIKit

var listOfWords = ["cake", "walking", "animals", "Table", "love", "bank"]
let incorrectMoveAllowed = 7




class ViewController: UIViewController {

@IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: . normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func enableLetterButton(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
        totalWins += 1
        }else {
        updateUI()
        }
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMoveAllowed, guessedLetters: [])
            enableLetterButton(true)
            updateUI()
        } else {
            enableLetterButton(false)
        }
    }
    
    var totalWins = 0 {
        didSet {
        newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
        newRound()
        }
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
    
  /*  func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMoveAllowed, guessedLetters: [])
        updateUI()
    
} */
    
    func updateUI() {
         var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}

