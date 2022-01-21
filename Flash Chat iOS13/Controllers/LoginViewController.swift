//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        self.emailTextfield.delegate = self
        self.passwordTextfield.delegate = self
        
        errorLabel.text = ""
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        login()
    }
    
    func login() {
        guard let email = emailTextfield.text else { return }
        guard let password = passwordTextfield.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let self = self else { return }
            if let error = error {
                print(error)
                self.errorLabel.text = error.localizedDescription
            }else{
                self.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        login()
        return true
    }
}
