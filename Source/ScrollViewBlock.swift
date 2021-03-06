//
//  ScrollViewBlock.swift
//  SASPager
//
//  Created by Manu Puthoor on 17/02/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit

@objc public protocol ScrollViewBlockDelegate: class {
    func bannerTapAction(index: Int)
    func startLoading()
    func stopLoading()
       
}

public class ScrollViewBlock: UIView {
    
    @IBOutlet public weak var scrollView: UIScrollView!
    @IBOutlet public weak var pageControl: UIPageControl!
    @IBOutlet public weak var delegate: ScrollViewBlockDelegate!
    
    public var baseVC: UIViewController! {
        didSet {
            settingPageViewController(baseVC: baseVC)
        }
    }
    public var viewBGColor: UIColor = .white
    
    public var slides:[Slide] = []
    public var testLabels:[String] = ["1","2","3"]
    public var webViews:[WebSubView] = [] {
        didSet {
            //xibSetup(bgColor: viewBGColor, hidePageControlDots: hidePageControlDots)
        }
    }
    public var contentView: UIView?
    public var hidePageControlDots: Bool = false {
        didSet {
             //xibSetup(bgColor: viewBGColor, hidePageControlDots: hidePageControlDots)
        }
    }
    public var webViewBGC: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    public var contentViewBGC: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    public var imgFit: UIView.ContentMode = .scaleAspectFit
    
    public var urlStrings: [String]? {
        didSet {
         //  settingWebViews(webViewBGC: webViewBGC, contentViewBGC: contentViewBGC)
        }
    }
    
    public var images: [UIImage?]? {
        didSet {
           // settingView(imgFit: imgFit)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(bgColor: viewBGColor, hidePageControlDots: hidePageControlDots)
    }
    
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup(bgColor: viewBGColor, hidePageControlDots: hidePageControlDots)
    }
    
    override public func layoutSubviews() {
        
        if let imgs = images, !imgs.isEmpty {
            //settingView(imgFit: imgFit)
        }
        
        if let urlStrs = urlStrings, !urlStrs.isEmpty {
           // settingWebViews(webViewBGC: webViewBGC, contentViewBGC: contentViewBGC)
        }
       
    }
    
    @IBAction func manualScrollView(_ sender: UIButton) {
      //  manualScrollingAction()
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
       // delegate?.bannerTapAction(index: pageControl.currentPage)
    }
    
}

 
