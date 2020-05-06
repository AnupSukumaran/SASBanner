//
//  ScrollViewBlock.swift
//  SASPager
//
//  Created by Manu Puthoor on 17/02/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit


public class ScrollViewBlock: UIView {
    
    @IBOutlet public weak var scrollView: UIScrollView!
    @IBOutlet public weak var pageControl: UIPageControl!

    public var slides:[Slide] = [];
    public var contentView:UIView?
    public var imgFit: UIView.ContentMode = .scaleAspectFit
    public var images: [UIImage?]? {
        didSet {
            settingView(imgFit: imgFit)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
    
    override public func layoutSubviews() {
       settingView(imgFit: imgFit)
    }
    
    @IBAction func manualScrollView(_ sender: UIButton) {
        manualScrollingAction()
    }
    
}

 
