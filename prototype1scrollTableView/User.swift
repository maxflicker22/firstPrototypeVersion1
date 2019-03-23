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
//    var userName: String?
    var email: String
    var pw: String
    
    var orgArr : [String]
    var punkte : Int
    
//    var dictionary:[String:Any?]? {
//        return [
//            "userId" : userId,
//            "userName" : userName,
//            "email" : email,
//            "pw" : pw,
//            "punkte" : punkte,
//
//            "orgDict" : orgDict
//        ]
//    }
    func userToDictonary() -> [String:Any]{
        
        var theDictionary: [String:Any] = [:]
        theDictionary["userId"] = userId
        theDictionary["email"] = email
        theDictionary["pw"] = pw
        
//        if let theorgArr = orgArr{
            theDictionary["orgArr"] = orgArr
//        }
        
    
            theDictionary["punkte"] = punkte
        
     
       
        return theDictionary
    }
    
    init(userId:String, email:String, pw: String, punkte:Int, orgArr: [String]){

        self.userId = userId
        self.email = email
        self.pw = pw
        self.orgArr = orgArr
        self.punkte = punkte

    }

    
}

extension User: DocumentSerializable{
    
//    init?(dictionary:[String:Any]){
//        guard let userId = dictionary["userId"] as? String,
//
//        let email = dictionary["email"] as? String,
//        let pw = dictionary["pw"] as? String,
//        let punkte = dictionary["punkte"] as? Int,
//            let orgDict = dictionary["orgDict"] as? [String:Int] else {return nil}
//
//        self.init(userId: userId, email: email, pw: pw, orgDict: orgDict, punkte: punkte)
    init?(dictionary:[String:Any]){
        guard let userId = dictionary["userId"] as? String,
        let email = dictionary["email"] as? String,
        let pw = dictionary["pw"] as? String,
        let punkte = dictionary["punkte"] as? Int,
            let orgArr = dictionary["orgArr"] as? [String] else {print("waaat2"); return nil}
        
//        self.init(userId: userId, email: email, pw: pw, orgDict: orgDict, punkte: punkte)
//        self.init(userId: userId, email: email, pw: pw, punkte: punkte, orgArr: orgArr)
        self.userId = userId
        self.email = email
        self.pw = pw
        self.punkte = punkte
        self.orgArr = orgArr
    }
}
