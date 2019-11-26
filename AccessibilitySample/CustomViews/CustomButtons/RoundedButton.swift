//
//  RoundedButton.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 25/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    var buttonCornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = buttonCornerRadius
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.clipsToBounds = true
        self.layer.cornerRadius = buttonCornerRadius
    }
    

}
