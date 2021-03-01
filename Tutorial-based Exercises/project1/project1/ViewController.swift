//
//  ViewController.swift
//  project1
//
//  Created by Sonja Ek on 19.2.2021.
//

import UIKit

class ViewController: UITableViewController {
    // Create an empty array that will later contain all image filenames:
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Create a share button:
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(shareTapped))
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! // This is where all the assets are
        // Read every filename in the assets directory:
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            // Add all relevant asset files to the 'pictures' array:
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort() // Day 18 challenge 2: sort by filename
        print(pictures) // This print only shows in the terminal
    }
    
    // Create table cells:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // Dequeue cells when scrolled:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // Label the cell according to corresponding image filename:
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    // When a cell is pressed, open a corresponding detail view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.position = (currentNumber: indexPath.row + 1, totalNumber: pictures.count)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // Share app:
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: [self], applicationActivities: [])
        // Without the following code this would crash on iPad (running iOS, dunno if needed in 2021):
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

