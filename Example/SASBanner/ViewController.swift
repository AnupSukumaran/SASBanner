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
    var dummyImgs = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView.images = dummyImgs
        bannerView.imgFit = .scaleAspectFit
        
    }

    @IBAction func scrollAction(_ sender: Any) {
        bannerView.manualScrollingAction()
      
        
    }
    
}

extension ViewController: ScrollViewBlockDelegate {
    func bannerTapAction(index: Int) {
        print("Index = \(index)")
        var vc: SecondViewController!
        if #available(iOS 13.0, *) {
            vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        } else {
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
            // Fallback on earlier versions
        }
        vc.toIndex = index
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
   
    
}
