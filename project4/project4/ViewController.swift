//
//  ViewController.swift
//  project4
//
//  Created by Sonja Ek on 26.2.2021.
//
/* TODO:
- Figure out why countries array doesn't contain the correct items.
- "You’ll also need to adjust your storyboard to include the detail view controller, including using Auto Layout to pin its image view correctly."
- "You will need to use UIActivityViewController to share your flag."
 */


import UIKit

class ViewController: UITableViewController {
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png"), let flag = item.components(separatedBy: ".png").first {
                countries.append(flag)
            }
        }
    }
    
    // Create table cells:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    // Dequeue cells when scrolled:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // Label the cell according to corresponding image filename:
        cell.textLabel?.text = countries[indexPath.row].uppercased()
        return cell
    }
    
    // When a cell is pressed, open a corresponding detail view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

