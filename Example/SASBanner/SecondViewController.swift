//
//  SecondViewController.swift
//  SASBanner_Example
//
//  Created by Manu Puthoor on 08/06/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SASBanner

class SecondViewController: UIViewController {

    @IBOutlet weak var bannerView: ScrollViewBlock!
    
    var toIndex: Int = 0
    var dummyImgs = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.viewBGColor = .black
        bannerView.images = dummyImgs
        bannerView.imgFit = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         bannerView.forceScrollingTo(index: toIndex)
    }

    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SecondViewController: ScrollViewBlockDelegate {
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func bannerTapAction(index: Int) {
        
    }
    
}
