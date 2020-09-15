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
    @IBOutlet weak var webViewBase: ScrollViewBlock!
    
    var urlStrs = ["https://homepages.cae.wisc.edu/~ece533/images/airplane.png", "https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf", "https://ars.els-cdn.com/content/image/1-s2.0-S0092867416303993-mmc7.pdf"]
    
    var dummyImgs = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let ss = AssetExtractor.createLocalUrl(forImageNamed: "1") {
            urlStrs.append(ss.absoluteString)
        }
        bannerView.baseVC = self
        webViewBase.webViewBGC = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        webViewBase.contentViewBGC = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        webViewBase.hidePageControlDots = true
        webViewBase.urlStrings = urlStrs
        
        bannerView.images = dummyImgs
        bannerView.imgFit = .scaleAspectFit
        bannerView.hidePageControlDots = !(dummyImgs.count > 1)
//        let path = Bundle.main.path(forResource: "1", ofType: "jpeg", inDirectory: "Images.xcassets")
//        let urlI = URL(fileURLWithPath: path!)
        
     
       // print("imgPath = \(AssetExtractor.createLocalUrl(forImageNamed: "1"))")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let vc = segue.destination as? PageSlideViewController {
        vc.testLabels = ["1","2","3"]
        
        }
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
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
}

class AssetExtractor {

    static func createLocalUrl(forImageNamed name: String) -> URL? {

        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let url = cacheDirectory.appendingPathComponent("\(name).png")
        let path = url.path

        guard fileManager.fileExists(atPath: path) else {
            guard
                let image = UIImage(named: name),
                let data = image.pngData()
                else { return nil }

            fileManager.createFile(atPath: path, contents: data, attributes: nil)
            return url
        }

        return url
    }

}
