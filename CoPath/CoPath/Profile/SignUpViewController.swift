//
//  SignUpViewController.swift
//  CoPath
//
//  Created by Henkky on 08/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var confirmPassField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func haveAccountTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goSignIn", sender: nil)
    }
    
}
