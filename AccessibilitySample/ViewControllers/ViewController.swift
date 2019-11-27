//
//  ViewController.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 25/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK:- @IBOutlets
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var userNameTextField: BottomLinedTextField!
    @IBOutlet weak var passwordTextField: BottomLinedTextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    @IBOutlet weak var rememberMeLabel: UILabel!
    @IBOutlet weak var loginHelpButton: UIButton!
    @IBOutlet weak var loginButton: RoundedButton!
    @IBOutlet weak var createUsernamePasswordButton: UIButton!
       @IBOutlet weak var exploreLoansButton: UIButton!
    @IBOutlet weak var tourTheAppButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable titleLabel fint size dynamic.
     createUsernamePasswordButton.titleLabel?.adjustsFontForContentSizeCategory = true
        exploreLoansButton.titleLabel?.adjustsFontForContentSizeCategory = true
        loginHelpButton.titleLabel?.adjustsFontForContentSizeCategory = true
        loginButton.titleLabel?.adjustsFontForContentSizeCategory = true
        tourTheAppButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        helpButton.titleLabel?.adjustsFontForContentSizeCategory = true
        helpButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        
        //Cofirm TextField Delegate
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        
        //Hides Keyboard when tapped in screen
        
        self.hideKeyboardWhenViewTapped()
        
        
        //Enable Accesibility
        enableAccessibilityToLoginScreen()
        
    }
    
    //MARK: @IBActions
    
    @IBAction func handleLoginHelpButtonAction(_ sender: UIButton) {
        showLoginHelpOptions()
    }
    
    //MARK: Private methods
    
    private func showLoginHelpOptions() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Forgot username?", style: .default, handler: { (action) in
            print("Forgot username")
            UIAccessibility.post(notification: .screenChanged, argument: self.loginHelpButton)
        }))
        
        alertController.addAction(UIAlertAction(title: "Reset password?", style: .default, handler: { (action) in
            print("Reset Password")
             UIAccessibility.post(notification: .screenChanged, argument: self.loginHelpButton)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Cancel Password")
             UIAccessibility.post(notification: .screenChanged, argument: self.loginHelpButton)
        }))
        
        present(alertController, animated: true, completion: nil)
    }
}


//MARK:- UITextFieldDelegate methods

extension ViewController: UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}





