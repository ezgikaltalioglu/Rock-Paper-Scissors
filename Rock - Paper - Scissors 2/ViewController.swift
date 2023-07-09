//
//  ViewController.swift
//  Rock - Paper - Scissors 2
//
//  Created by Ezgi Kaltalıoğlu on 9.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userChoiceLabel: UILabel!
    
    var userChoice: String?
    var score: Int = 0
    
    @IBAction func resetScoreButtonTapped(_ sender: Any) {
        resetScore()
    }
    
    @IBAction func stoneButtonTapped(_ sender: Any) {
        userChoice = "Taş"
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    @IBAction func paperButtonTapped(_ sender: Any) {
        userChoice = "Kağıt"
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    @IBAction func scissorsButtonTapped(_ sender: Any) {
        userChoice = "Makas"
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let resultVC = segue.destination as? ResultViewController {
                let computerChoice = ["Taş", "Kağıt", "Makas"].randomElement()!
                resultVC.userChoice = userChoice
                resultVC.computerChoice = computerChoice
                if let result = getResult(userChoice: userChoice, computerChoice: computerChoice) {
                    score += result
                }
                resultVC.score = score
            }
        }
    }
    
    func getResult(userChoice: String?, computerChoice: String) -> Int? {
        guard let userChoice = userChoice else {
            return nil
        }
        if userChoice == computerChoice {
            return 0 
        } else if (userChoice == "Taş" && computerChoice == "Makas") || (userChoice == "Kağıt" && computerChoice == "Taş") || (userChoice == "Makas" && computerChoice == "Kağıt") {
            return 1
        } else {
            return -1
        }
    }
    
    func resetScore() {
        score = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}
