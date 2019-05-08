//
//  SignInViewController.swift
//  CoPath
//
//  Created by Henkky on 08/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func noAccountTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goSignUp", sender: nil)
    }
    
    
    @IBAction func signInTapped(_ sender: UIButton) {
    }
    
}
