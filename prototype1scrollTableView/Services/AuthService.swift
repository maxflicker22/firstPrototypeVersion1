//
//  AuthService.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 17.02.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import Foundation
import FirebaseAuth


typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil{
       
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                    } else {
                //Successfully logged in
                onComplete?(nil, user)
                print("angemeldet")
                
            }
        })
    
    }
   func signin(email: String, password: String, onComplete: Completion?) {
    
    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
        if error != nil {
            self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
        } else {
            
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil{
                    
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                } else {
                    //Successfully logged in
                    onComplete?(nil, user)
                    print("angemeldet")
                    
                }
            })
            
  
            
//            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//            changeRequest?.displayName = email
//
//            changeRequest?.commitChanges { error in
//                if error == nil {
//                    print("User display name changed!")
//                    print(Auth.auth().currentUser?.uid)
//
//                } else {
//                   onComplete?(error?.localizedDescription, nil)
//                }
            
            
            }
        })
    }
    
    
    func createUserDocument(){
        
    }
    
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = AuthErrorCode(rawValue: error.code) {
            switch (errorCode) {
            case .invalidEmail:
                onComplete?("Invalid email adress", nil)
                break
            case .wrongPassword:
                onComplete?("Invalid password", nil)
                break
            case .emailAlreadyInUse, .accountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in use", nil)
                break
            case .userNotFound:
                onComplete?("Please Sign In First!", nil)
            default:
                onComplete?("There was a problem authentificating. Try again", nil)
                
            
            }
        }
    }
    
    
    
}


