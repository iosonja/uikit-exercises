//
//  ViewController.swift
//  project2
//
//  Created by Sonja Ek on 21.2.2021.
//

import UIKit

class ViewController: UIViewController {
    // Create buttons that will display flag images:
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    // Create empty array that will contain all the countries included in the game:
    var countries = [String]()
    // Initialize a score counter to track the player's success:
    var score = 0
    // Create a placeholder for what will be the int representing the correct flag on each round:
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add included countries in the previously created array:
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // For visual clarity, add borders to the flag buttons:
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // Give the button borders a color as UIColor, convert to CGColor format because
        // borders are on the Core Graphics level:
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        // First randomly pick 3 of the countries to be options, then pick one of them to be the
        // correct answer:
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        // Fetch images corresponding to the chosen country names from the asset catalog and
        // set them to the three buttons that were created in viewDidLoad():
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Show a country name as a navigation bar title. This is the country we randomly got as
        // the correct answer to this round. Uppercase the entire name because there are countries
        // with names including only initials, such as UK and US on the list.
        title = countries[correctAnswer].uppercased()
    }

    // The following method defines what will be done when any of the three buttons is tapped.
    // It's connected to all the buttons on the main storyboard. The parameter sends the info
    // on which button was pressed. The buttons are identified with tags, which are integers.
    // The tags are defined in the main storyboard.
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String // Will be shown in an alert
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        // Create an alert that will have nothing but text after this:
        let ac = UIAlertController(title: title,
                                   message: "Your score is \(score)",
                                   preferredStyle: .alert)
        
        // Add a dismiss button to the alert so that the player can continue:
        ac.addAction(UIAlertAction(title:"Continue", style: .default, handler: askQuestion))
        // askQuestion is a closure, not method, and this is on purpose.
        
        // The alert will be presented after each button tap, only the text changes according to
        // whether or not the answer was correct:
        present(ac, animated: true)
    }
    
}

