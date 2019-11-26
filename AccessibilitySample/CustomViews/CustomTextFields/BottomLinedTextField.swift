//
//  BottomLinedTextField.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 25/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import UIKit

class BottomLinedTextField: UITextField {
    
    //MARK: Cosntants.
    let bottomLineLayer = CALayer()
    
    //MARK: Variables.
    var widthBorder: CGFloat = 1.0 {
        didSet {
            bottomLineLayer.borderWidth = widthBorder
        }
    }
    
    var colorBorder: UIColor = UIColor.darkGray {
        didSet {
            bottomLineLayer.borderColor = colorBorder.cgColor
        }
    }
    
    var placeholderColor: UIColor = .darkGray

    override var placeholder: String? {
        didSet {
            let attributes = [NSAttributedString.Key.foregroundColor: placeholderColor ]
            self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
        }
    }
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBottomLineLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBottomLineLayer()
    }
    
    //MARK: Private Methods.
    private func setupBottomLineLayer() {
        bottomLineLayer.borderColor = colorBorder.cgColor
        bottomLineLayer.frame = CGRect(x: 0, y: self.frame.size.height - widthBorder, width: self.frame.size.width, height: self.frame.size.height)
        bottomLineLayer.borderWidth = widthBorder
        self.layer.addSublayer(bottomLineLayer)
        self.layer.masksToBounds = true
        
        let attributes = [NSAttributedString.Key.foregroundColor: placeholderColor ]
        self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
    }
    
}
