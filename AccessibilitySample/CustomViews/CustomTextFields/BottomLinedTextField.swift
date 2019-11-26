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
    var bottomLineView = UIView()
    
    //MARK: Variables.
    var widthBorder: CGFloat = 1.0 {
        didSet {
            bottomLineView.heightAnchor.constraint(equalToConstant: widthBorder).isActive = true
        }
    }
    
    var colorBorder: UIColor = UIColor.darkGray {
        didSet {
            bottomLineView.backgroundColor = colorBorder
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
        setupBottomLineView()
        setupPlaceHolder()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBottomLineView()
        setupPlaceHolder()
    }
    
    //MARK: Private Methods.
    private func setupBottomLineView() {
        
        self.translatesAutoresizingMaskIntoConstraints = false

        bottomLineView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bottomLineView.backgroundColor = colorBorder
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(bottomLineView)

        bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomLineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomLineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomLineView.heightAnchor.constraint(equalToConstant: widthBorder).isActive = true
        
        
    }
    private func setupPlaceHolder() {
        let attributes = [NSAttributedString.Key.foregroundColor: placeholderColor ]
        self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
    }
}


