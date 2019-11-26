//
//  ViewController+Accessibility.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 26/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import Foundation

enum LoginScreenAccessibilityLabels {
    static let helpButton = "Help Button"
    static let rememberMeSwitch = "Remember Me"
    static let loginHelpButton = "Login Help"
    static let loginButton = "Log in"
    static let createUsernamePasswordButton = "Create a username and password"
    static let exploreLoanButton = "Explore loans, cards & more"
    static let tourTheAppButton = "Tour the app"
}

enum LoginScreenAccessibilityHints {
    static let rememberMeSwitch = "Switch on to Remember login"
    static let loginHelpButton = "To reset password or Forgot Password"
}

extension ViewController {
    
    func enableAccessibilityToLoginScreen() {
        addAccessibilityToHelpButton()
        addAccessibilityToRemenberLoginSwitch()
        addAccessibilityToLoginHelpButton()
        addAccessibilityToLoginButton()
        addAccessibilityToCreateAUsernameAndPasswordButton()
        addAccessibilityToExploreLoanButton()
        addAccessibilityToTourTheAppButton()
    }
    
    func addAccessibilityToHelpButton() {
        helpButton.isAccessibilityElement = true
        helpButton.accessibilityLabel = LoginScreenAccessibilityLabels.helpButton
    }
    
    func addAccessibilityToRemenberLoginSwitch() {
        rememberMeSwitch.isAccessibilityElement = true
        rememberMeSwitch.accessibilityLabel = LoginScreenAccessibilityLabels.rememberMeSwitch
        rememberMeSwitch.accessibilityHint = LoginScreenAccessibilityHints.rememberMeSwitch
    }
    
    func addAccessibilityToLoginHelpButton() {
        loginHelpButton.isAccessibilityElement = true
        loginHelpButton.accessibilityLabel = LoginScreenAccessibilityLabels.loginHelpButton
        loginHelpButton.accessibilityHint = LoginScreenAccessibilityHints.loginHelpButton
    }
    
    func addAccessibilityToLoginButton() {
        loginButton.isAccessibilityElement = true
        loginButton.accessibilityLabel = LoginScreenAccessibilityLabels.loginButton
    }
    
    func addAccessibilityToCreateAUsernameAndPasswordButton() {
        createUsernamePasswordButton.isAccessibilityElement = true
        createUsernamePasswordButton.accessibilityLabel = LoginScreenAccessibilityLabels.createUsernamePasswordButton
    }
    
    func addAccessibilityToExploreLoanButton() {
        exploreLoansButton.isAccessibilityElement = true
        exploreLoansButton.accessibilityLabel = LoginScreenAccessibilityLabels.exploreLoanButton
    }
    
    func addAccessibilityToTourTheAppButton() {
        tourTheAppButton.isAccessibilityElement = true
        tourTheAppButton.accessibilityLabel = LoginScreenAccessibilityLabels.tourTheAppButton
    }
    
}
