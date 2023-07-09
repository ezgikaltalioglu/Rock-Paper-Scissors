//
//  ResultViewController.swift
//  Rock - Paper - Scissors 2
//
//  Created by Ezgi Kaltalıoğlu on 9.07.2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var userChoice: String?
    var computerChoice: String?
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResult()
    }
    
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showResult() {
        if let userChoice = userChoice, let computerChoice = computerChoice {
            let result = getResult(userChoice: userChoice, computerChoice: computerChoice)
            resultLabel.text = resultText(result: result)
        }
        
        scoreLabel.text = "Score: \(score)"
    }
    
    func getResult(userChoice: String, computerChoice: String) -> String {
        if userChoice == computerChoice {
            return "It's a tie!"
        } else if (userChoice == "Taş" && computerChoice == "Makas") || (userChoice == "Kağıt" && computerChoice == "Taş") || (userChoice == "Makas" && computerChoice == "Kağıt") {
            return "You win!"
        } else {
            return "Computer wins!"
        }
    }
    
    func resultText(result: String) -> String {
        switch result {
        case "It's a tie!":
            return "It's a tie! Both chose the same."
        case "You win!":
            return "You win! \(userChoice!) beats \(computerChoice!)."
        case "Computer wins!":
            return "Computer wins! \(computerChoice!) beats \(userChoice!)."
        default:
            return ""
        }
    }
}
