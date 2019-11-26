//
//  UIViewControllerExtension.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 26/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    //MARK: Hide Keyboard on tap
    func hideKeyboardWhenViewTapped() {
        let tapGuesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tapGuesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGuesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}



