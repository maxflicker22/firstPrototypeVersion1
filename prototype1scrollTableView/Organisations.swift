//
//  Organisations.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import Foundation
import Firestore

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct Organisations {
    var name: String
    var totalReach: Int
    var actuallyReach: Int
    var imageURL: String
    var description: String
    
    var gesamtZahl: Int
    
    
    
    var dictionary:[String:Any] {
        return [
            "name" : name,
            "totalReach" : totalReach,
            "actuallyReach" : actuallyReach,
            "imageURL" : imageURL,
            "description" : description,
            "gesamtZahl" : gesamtZahl
        ]
    }
    
    
//    static let exampleOrganisations = [
//        Organisations(name: "4Ocean", totalReach: 10000, actuallyReach: 1000,  imageURL: "4ocean", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000),
//        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia", description: "Desasdfsf", userAnzahl: 100, userName: "Max", gesamtZahl: 100000)]
//
////    description: "4 Ocean is a Organisation that pulls trash out of the oceans", userName = "Max", gesamtZahl = 100000
////    description: "Ecosia is a Searching-Machin, which plants tree with its earnings",userName = "Max", gesamtZahl = 100000
}
extension Organisations: DocumentSerializable{
    init?(dictionary: [String:Any]) {
        guard let name = dictionary["name"] as? String,
            let totalReach = dictionary["totalReach"] as? Int,
            let actuallyReach = dictionary["actuallyReach"] as? Int,
            let imageURL = dictionary["imageURL"] as? String,
            let description = dictionary["description"] as? String,
            let gesamtZahl = dictionary["gesamtZahl"] as? Int else {return nil}
        
        self.init(name: name, totalReach: totalReach, actuallyReach: actuallyReach, imageURL: imageURL, description: description, gesamtZahl: gesamtZahl)
    
    
    
}
    
}
    
    
    



