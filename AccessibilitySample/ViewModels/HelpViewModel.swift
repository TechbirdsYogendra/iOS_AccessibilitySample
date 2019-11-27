//
//  HelpViewModel.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 27/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import UIKit

class HelpViewModel: NSObject {
    
    let moreInfoAbout = "Get more information about:"
    let moreInfoAbouts = ["How do I send money to a person?", "How do I check my messages?", "How can I increase security on my smartphone or tablet?"]
    
    let guidedHelp = "Guided help"
    let guidedHelps = ["Get help sending money", "Get help requesting money", "Get help splitting a bill"]
    
    override init() {
        
    }
    
    func numberOfMoreInfoAboutItems() -> Int {
        return moreInfoAbouts.count
    }
    
    func numberOfGuidedHelpItems() -> Int {
        return guidedHelps.count
    }
}
