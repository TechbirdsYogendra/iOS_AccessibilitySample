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
    
    @IBOutlet weak var createUsernamePasswordButton: UIButton!
    @IBOutlet weak var exploreLoansButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    //MARK: @IBActions
    
    @IBAction func handleLoginHelpButtonAction(_ sender: UIButton) {
        showLoginHelpOptions()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //MARK: Private methods
    private func showLoginHelpOptions() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Forgot username?", style: .default, handler: { (action) in
            print("Forgot username")
        }))
        
        alertController.addAction(UIAlertAction(title: "Reset password?", style: .default, handler: { (action) in
            print("Reset Password")
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension UIButton {

    @IBInspectable
    var adjustsFontForContentSizeCategory: Bool {
        set {
            self.titleLabel?.adjustsFontForContentSizeCategory = newValue
        }
        get {
            return self.titleLabel?.adjustsFontForContentSizeCategory ?? false
        }
    }
}

