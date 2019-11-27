//
//  GuidedHelpTableViewCell.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 27/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import UIKit

class GuidedHelpTableViewCell: UITableViewCell {

    //MARK:- @IBOutlets
    @IBOutlet weak var txtLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.isAccessibilityElement = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(_ text: String) {
        txtLabel.text = text
        self.accessibilityLabel = text
    }
}
