//
//  ScrollViewBlock+Ext.swift
//  SASPager
//
//  Created by Manu Puthoor on 17/02/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit
import WebKit

extension ScrollViewBlock: UIScrollViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        actionAfterScrolling(scrollView, pageControl: pageControl, view: self)
    }
    
    func loadViewFromNib(_ bgColor: UIColor = .white) -> UIView? {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ScrollViewBlock", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.backgroundColor = bgColor
        return view
    }
    
    func loadPageSlideViewController(_ bgColor: UIColor = .white, baseVC: UIViewController)  -> UIView? {

        let bundle = Bundle(for: type(of: self))
        let pageVC = PageSlideViewController(nibName: "PageSlideViewController", bundle: bundle)//UINib(nibName: "ScrollViewBlock", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//        view.backgroundColor = bgColor
//        view.ad
        //pageVC.didMove(toParent: self)
        //pageVC.view.frame =
        baseVC.addChild(baseVC)
        pageVC.testLabels = testLabels
        
        return pageVC.view
       // addSubview(pageVC.view)
    }
    

    func xibSetup(bgColor: UIColor = .white, hidePageControlDots: Bool) {
        
        guard let view = loadViewFromNib(bgColor) else {return }
//        pageControl.isHidden = hidePageControlDots
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        addSubview(view)
        contentView = view
//        if let vcView = loadPageSlideViewController(bgColor, baseVC: baseVC) {
//            vcView.frame = view.frame
//            view.addSubview(vcView)
//            addSubview(view)
//
//            contentView = view
//            contentView?.bringSubviewToFront(vcView)
//
//        }
    
       
    }
    
    func settingPageViewController(baseVC: UIViewController) {
        let bundle = Bundle(for: type(of: self))
        
        
        
        var pageVC = PageSlideViewController(nibName: "PageSlideViewController", bundle: bundle)
        
        pageVC = PageSlideViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
         pageVC.testLabels = testLabels
        baseVC.addChild(pageVC)
        pageVC.view.frame = self.frame
        self.addSubview(pageVC.view)
        pageVC.didMove(toParent: baseVC)
    }
    
    func settingWebViews(webViewBGC: UIColor, contentViewBGC: UIColor ) {
        scrollView.delegate = self
        guard let urlStrs = urlStrings else {return}
        webViews = createWebViews(urls: urlStrs, webViewBGC: webViewBGC, contentViewBGC: contentViewBGC)
        setupScrollViewForView(views: webViews)
        pageControlSetupForViews(views: webViews)
    }


    func settingView(imgFit: UIView.ContentMode = .scaleAspectFit) {
        scrollView.delegate = self
         guard let img = images else {return}
        slides = (createSlides(images: img, view: self))
        slides.forEach{$0.imageView.contentMode = imgFit}
        setupSlideScrollView()
        pageControlSetup()
    }
    
    func settingViewForPageViewController(imgFit: UIView.ContentMode = .scaleAspectFit) {
        scrollView.delegate = self
         guard let img = images else {return}
        slides = (createSlides(images: img, view: self))
        slides.forEach{$0.imageView.contentMode = imgFit}
        setupSlideScrollView()
        pageControlSetup()
    }
    
    func pageControlSetup() {
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        bringSubviewToFront(pageControl)
    }

    func pageControlSetupForViews(views: [UIView]) {
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        bringSubviewToFront(pageControl)
    }
    
    func createWebViews(urls: [String], webViewBGC: UIColor, contentViewBGC: UIColor) -> [WebSubView] {
        var webViews = [WebSubView]()
        
        for i in urls {
            let webView = WebSubView()
            let webConfiguration = WKWebViewConfiguration()
            webView.webView = WKWebView(frame: contentView!.frame, configuration: webConfiguration)
            webView.webView.allowsBackForwardNavigationGestures = true
            webView.webView.backgroundColor = webViewBGC
            webView.contentView.backgroundColor = contentViewBGC
            webView.webView.uiDelegate = self
            webView.webView.navigationDelegate = self
            webView.contentView.addSubview(webView.webView)
            guard let url = URL(string: i) else {continue}
            
            var req = URLRequest(url: url)
            req.cachePolicy = .returnCacheDataElseLoad
            webView.webView.load(req)
            webViews.append(webView)
        }
        return webViews
    }

    func createSlides(images: [UIImage?],  view: UIView) -> [Slide] {
        var slides = [Slide]()
        
        for i in images {
            let sli = Slide()
            sli.imageView.backgroundColor = viewBGColor
            sli.imageView.image = i
            slides.append(sli)
        }

        return slides
    }

    
    func setupScrollViewForView(views: [UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        scrollView.contentSize = CGSize(width: frame.width * CGFloat(views.count), height: frame.height)
        scrollView.isPagingEnabled = true

        for i in 0 ..< views.count {
            views[i].frame = CGRect(x: frame.width * CGFloat(i), y: 0, width: frame.width, height: frame.height)
            scrollView.addSubview(views[i])
        }
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
    
    func setupPageSlide() {
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
    
    public func forceScrollingTo(index: Int) {
        let scrollXAxisContentOffset = scrollView.contentOffset.x
        let viewWidth = frame.width * CGFloat(index)
        (scrollView.setContentOffset(CGPoint(x: scrollXAxisContentOffset + viewWidth , y: 0), animated: true))
    }


    func actionAfterScrolling(_ scrollView: UIScrollView, pageControl: UIPageControl, view: UIView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
}

extension ScrollViewBlock:  WKUIDelegate, WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        delegate.startLoading()
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        delegate.stopLoading()
    }
}
