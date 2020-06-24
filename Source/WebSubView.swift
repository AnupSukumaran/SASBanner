//
//  WebSubView.swift
//  Pods-SASBanner_Example
//
//  Created by Manu Puthoor on 15/06/20.
//

import UIKit
import WebKit

@IBDesignable
public class WebSubView: UIView {
    
    @IBOutlet var contentView: UIView!
    public var webView: WKWebView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commenInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commenInit()
    }

    
    
    func commenInit() {
        let bundle = Bundle(for: type(of: self))
        let nib =  UINib(nibName: "WebSubView", bundle: bundle)
       

        self.contentView = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(contentView)

    }

}
