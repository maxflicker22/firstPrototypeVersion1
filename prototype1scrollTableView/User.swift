//
//  User.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 12.03.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import Foundation

struct User {
    
    var userId: String
    var userName: String
    var email: String
    var pw: String
    
    var orgDict : [String:Int]
    var punkte : Int
    
    var dictionary:[String:Any] {
        return [
            "userId" : userId,
            "userName" : userName,
            "email" : email,
            "pw" : pw,
            "punkte" : punkte,
            
            "orgDict" : orgDict
        ]
    }
    
    
}

extension User: DocumentSerializable{
    
    init?(dictionary:[String:Any]){
        guard let userId = dictionary["userId"] as? String,
        let userName = dictionary["userName"] as? String,
        let email = dictionary["email"] as? String,
        let pw = dictionary["pw"] as? String,
        let punkte = dictionary["punkte"] as? Int,
            let orgDict = dictionary["orgDict"] as? [String:Int] else {return nil}
        
        self.init(userId: userId, userName: userName, email: email, pw: pw, orgDict: orgDict, punkte: punkte)
        
    }
}
