//
//  RegistViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 17.02.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit
import Firebase
import Firestore

class RegistViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfiele: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        handleSignUp()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
//        usernameTextfield.delegate = self
//        passwordTextfiele.delegate = self
//
//        usernameTextfield.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
//        passwordTextfiele.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextfield.becomeFirstResponder()
       
 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        usernameTextfield.resignFirstResponder()
       
        passwordTextfiele.resignFirstResponder()
        
        NotificationCenter.default.removeObserver(self)
    }
    
//    @objc func textFieldChanged(_ target:UITextField) {
//        let username = usernameTextfield.text
//
//        let password = passwordTextfiele.text
//
//    }
    
    @objc func handleSignUp() {
        guard let username = usernameTextfield.text else { return }
        guard let pass = passwordTextfiele.text else { return }
        
        
        
//        Auth.auth().createUser(withEmail: username, password: pass) { user, error in
//            if error == nil && user != nil {
//                print("User created!")
//
//                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//                changeRequest?.displayName = username
//
//                changeRequest?.commitChanges { error in
//                    if error == nil {
//                        print("User display name changed!")
//                        print(Auth.auth().currentUser?.uid)
//                        self.dismiss(animated: false, completion: nil)
//                    } else {
//                        print("Error: \(error!.localizedDescription)")
//                    }
//                }
//
//            } else {
//                print("Error: \(error!.localizedDescription)")
//            }
//        }
        AuthService.instance.signin(email: username, password: pass, onComplete: {(errMsg, data) in
            guard errMsg == nil else {
                let alert = UIAlertController(title: "Error Authentification", message: errMsg, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            self.dismiss(animated: false, completion: nil)
            print("angemeldet")
        })
        
    }
    
    
    

    


}
