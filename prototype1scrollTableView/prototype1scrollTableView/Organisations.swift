//
//  Organisations.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import Foundation

struct Organisations {
    
    var name: String
    var totalReach: Int
    var actuallyReach: Int
    var imageURL: String
    

    
    
    
    static let exampleOrganisations = [
        Organisations(name: "4Ocean", totalReach: 10000, actuallyReach: 1000,  imageURL: "4ocean"),
        Organisations(name: "Ecosia", totalReach: 10000, actuallyReach: 500,  imageURL: "Ecosia")]
}
