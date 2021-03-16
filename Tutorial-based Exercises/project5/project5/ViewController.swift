//
//  ViewController.swift
//  project5
//
//  Created by Sonja Ek on 8.3.2021.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                           target: self,
                                                           action: #selector(startGame))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty { // More efficient than counting length
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    @objc func startGame() {
        // Pick a random word for a new challenge:
        title = allWords.randomElement()
        // Remove all values from the usedWords array:
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer",
                                   message: nil,
                                   preferredStyle: .alert)
        ac.addTextField() // This is where user puts their answers
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            // Avoid strong reference cycle, very important for performance:
            [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    if isNew(word: lowerAnswer) {
                        usedWords.insert(lowerAnswer, at: 0)
                        
                        let indexPath = IndexPath(row: 0, section: 0)
                        tableView.insertRows(at: [indexPath], with: .automatic)
                        // The .automatic argument: "do whatever is the standard system animation here"
                        
                        return
                    } else {
                        showErrorMessage(title: "Same as the original word",
                                         msg: "You have to come up with new words!")
                    }
                } else {
                    showErrorMessage(title: "Word not recognized",
                                     msg: "You can't just make them up, you know!")
                }
            } else {
                showErrorMessage(title: "Word already used",
                                 msg: "Be more original!")
            }
        } else {
            showErrorMessage(title: "Word not possible",
                             msg: "You can't spell that word from \(title!.lowercased()).")
        }
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        if word.count < 3 {
            return false
        }
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
//        "When you’re working with UIKit, SpriteKit, or any other Apple framework, use utf16.count
//        for the character count. If it’s just your own code - i.e. looping over characters and
//        processing each one individually – then use count instead."
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word,
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
        return misspelledRange.location == NSNotFound
        // = "not found", basically nil
    }
    
    func isNew(word: String) -> Bool {
        if word == title {
            return false
        }
        
        return true
    }
    
    func showErrorMessage(title errorTitle: String, msg errorMessage: String) {
        let ac = UIAlertController(title: errorTitle,
                                   message: errorMessage,
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

}

