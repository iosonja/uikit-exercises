//
//  DetailViewController.swift
//  project1
//
//  Created by Sonja Ek on 19.2.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
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
        
        // Set navigation bar title:
        title = "Picture \(position.currentNumber) of \(position.totalNumber)"
        navigationItem.largeTitleDisplayMode = .never
        
        // Create a share button:
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(shareTapped))
        // UIBarButtonItem is written in obj-c, so we need to make the shareTapped() method visible
        // to obj-c so that it can be run in the arguments.
        // The hash in the #selectore argument tells the Swift compiler there will be a method for this

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    // Allow user to hide navigation bar with a tap:
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // Allow user to unhide navigation bar:
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // Define what to share when the share button is tapped:
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, selectedImage as Any], applicationActivities: [])
        // Without the following code this would crash on iPad (running iOS):
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    // The file info.plist still needs to be modified to ask for user's permission to write data
}
