//
//  ScrollViewBlock+Ext.swift
//  SASPager
//
//  Created by Manu Puthoor on 17/02/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit


extension ScrollViewBlock: UIScrollViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        actionAfterScrolling(scrollView, pageControl: pageControl, view: self)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ScrollViewBlock", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    func settingView() {
        scrollView.delegate = self
        slides = (createSlides(images: images as! [UIImage], view: self))
        setupSlideScrollView()
        pageControlSetup()
    }

    func pageControlSetup() {
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        bringSubviewToFront(pageControl)
    }

    func createSlides(images: [UIImage],  view: UIView) -> [Slide] {
        var slides = [Slide]()
        
        for i in images {
            let sli = Slide()
            sli.imageView.image = i
            slides.append(sli)
        }

        return slides
    }


    func setupSlideScrollView() {
        scrollView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        scrollView.contentSize = CGSize(width: frame.width * CGFloat(slides.count), height: frame.height)
        scrollView.isPagingEnabled = true

        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: frame.width * CGFloat(i), y: 0, width: frame.width, height: frame.height)
            scrollView.addSubview(slides[i])
        }
    }

    public func manualScrollingAction() {

        let maxScrollContentWidth = scrollView.contentSize.width
        let scrollFrameWidth = scrollView.frame.size.width
        let scrollXAxisContentOffset = scrollView.contentOffset.x
        let viewWidth = frame.width
        let changingScrollWidth = (scrollFrameWidth + scrollXAxisContentOffset + viewWidth)

        (maxScrollContentWidth > changingScrollWidth) ?
        (scrollView.setContentOffset(CGPoint(x: scrollXAxisContentOffset + viewWidth, y: 0), animated: true)) :
        (scrollView.setContentOffset(CGPoint(x: (maxScrollContentWidth - scrollFrameWidth), y: 0), animated: true))

    }


    func actionAfterScrolling(_ scrollView: UIScrollView, pageControl: UIPageControl, view: UIView) {

        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)

    }
    
}
