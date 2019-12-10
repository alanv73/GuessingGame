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
    @IBOutlet weak var txtGuess: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblOutput.text = ""
    }

    @IBAction func btnGuess(_ sender: Any) {
        let secret = arc4random_uniform(5) + 1
        let guess = UInt32(txtGuess.text ?? "0")
        let message: String
        
        if guess == secret {
            message = "Correct!"
        } else {
            message = "Sorry, I am holding \(secret) fingers up"
        }
        
        lblOutput.text = message
    }
    
}

