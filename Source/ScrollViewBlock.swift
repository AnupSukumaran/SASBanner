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
}

public class ScrollViewBlock: UIView {
    
    @IBOutlet public weak var scrollView: UIScrollView!
    @IBOutlet public weak var pageControl: UIPageControl!
    @IBOutlet weak var delegate: ScrollViewBlockDelegate!
    
    public var viewBGColor: UIColor = .white
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
        xibSetup(bgColor: viewBGColor)
    }
    
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup(bgColor: viewBGColor)
    }
    
    override public func layoutSubviews() {
       settingView(imgFit: imgFit)
    }
    
    @IBAction func manualScrollView(_ sender: UIButton) {
        manualScrollingAction()
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        delegate?.bannerTapAction(index: pageControl.currentPage)
    }
    
}

 
