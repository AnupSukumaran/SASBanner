//
//  ViewController.swift
//  SASBanner
//
//  Created by AnupSukumaran on 03/21/2020.
//  Copyright (c) 2020 AnupSukumaran. All rights reserved.
//

import UIKit
import SASBanner

class ViewController: UIViewController {
    
    @IBOutlet weak var bannerView: ScrollViewBlock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.images = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
        
    }

    @IBAction func scrollAction(_ sender: Any) {
        bannerView.manualScrollingAction()
    }
    
}

