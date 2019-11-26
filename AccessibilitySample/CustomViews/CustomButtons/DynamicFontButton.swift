//
//  DynamicFontButton.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 26/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import UIKit

class DynamicFontButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customization()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        customization()
    }
    
    func customization(){
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.textAlignment = .center

        self.removeConstraints(self.constraints)
        if titleLabel != nil{
            let leadingConstraint = NSLayoutConstraint(item: titleLabel!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: titleLabel!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: titleLabel!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: titleLabel!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
            self.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
            self.layoutIfNeeded()
        }
        
    }
    
}
