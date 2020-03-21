//
//  Slide.swift
//  SASPager
//
//  Created by Manu Puthoor on 14/02/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit

@IBDesignable
public class Slide: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var contentView: UIView!
    
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
        let nib =  UINib(nibName: "Slide", bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(contentView)

    }
   
}
