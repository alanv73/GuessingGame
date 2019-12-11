//
//  ViewController.swift
//  guessingGame
//
//  Created by Alan Van Art on 12/10/19.
//  Copyright © 2019 Alan Van Art. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblOutput: UILabel!
    @IBOutlet weak var lblGuess: UILabel!
    @IBOutlet weak var txtGuess: UITextField!
    @IBOutlet weak var imgFingers: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblOutput.text = ""
        lblGuess.text = ""
        txtGuess.becomeFirstResponder()
    }
    
    @IBAction func guessClick(_ sender: Any) {
        txtGuess.text = ""
        
    }
    
    @IBAction func btnGuess(_ sender: Any) {
        let handImage = [
            1: "one.png",
            2: "two.png",
            3: "three.png",
            4: "four.png",
            5: "five.png"
        ]
        let secret = Int(arc4random_uniform(5)) + 1
        let guess = Int(txtGuess.text ?? "0") ?? 0
        let message: String
        var guessIsGood = true
        
        if guess < 1 || guess > 5 {
            message = "Invalid guess"
            guessIsGood = false
        } else if guess == secret {
            message = "Correct!"
        } else {
            message = "Sorry"
        }
        
        if guessIsGood {
            txtGuess.text = ""
            lblGuess.text = "You Guessed \(guess)"
            imgFingers.image = UIImage(named:handImage[Int(secret)] ?? "")
            imgFingers.isHidden = false
        } else {
            imgFingers.isHidden = true
        }
        
        lblOutput.text = message
        
        txtGuess.resignFirstResponder()
    }
    
}

