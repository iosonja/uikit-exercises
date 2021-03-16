//
//  ViewController.swift
//  challenge2
//
//  Created by Sonja Ek on 16.3.2021.
//

import UIKit

class ViewController: UITableViewController {
    var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        
        // Add a new item:
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(promptForAnswer))
        // Empty list:
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash,
                                                           target: self,
                                                           action: #selector(clearList))
    }
    
    @objc func clearList() {
        items.removeAll(keepingCapacity: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter item",
                                   message: nil,
                                   preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Add to list", style: .default) {
            // Avoid strong reference cycle, very important for performance:
            [weak self, weak ac] action in
            guard let newItem = ac?.textFields?[0].text else { return }
            self?.submit(newItem)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ newItem: String) {
        items.insert(newItem, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

}

