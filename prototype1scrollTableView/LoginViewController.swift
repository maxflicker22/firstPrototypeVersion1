//
//  LoginViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 17.02.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
       private var pageViewController: UIPageViewController!
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        handleSignIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        

        
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        usernameTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleSignIn() {
        
        guard let username = usernameTextfield.text else { return }
            guard let pass = passwordTextfield.text else { return }
        

 
        AuthService.instance.login(email: username, password: pass, onComplete: {(errMsg, data) in
            guard errMsg == nil else {
                let alert = UIAlertController(title: "Error Authentification", message: errMsg, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            self.dismiss(animated: false, completion: nil)
       
            
        })
        
        }

}

