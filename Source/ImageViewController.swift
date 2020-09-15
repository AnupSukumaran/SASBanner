//
//  ImageViewController.swift
//  Pods-SASBanner_Example
//
//  Created by Manu Puthoor on 15/09/20.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    var testText = ""
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = testText
    }

}
