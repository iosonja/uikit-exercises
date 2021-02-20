//
//  DetailViewController.swift
//  project1
//
//  Created by Sonja Ek on 19.2.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView!
    var selectedImage: String?
    var position: (currentNumber: Int, totalNumber: Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title used in the tutorial:
        // title = selectedImage
        
        // Title changed for Day 18 challenge 3: Show "Picture x of y"
        // To do that, position needs to be unwrapped
        guard let position = position else {
            print("No position provided")
            return
        }
        
        title = "Picture \(position.currentNumber) of \(position.totalNumber)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
