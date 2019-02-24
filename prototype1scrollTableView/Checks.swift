//
//  Checks.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 18.01.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import Foundation

struct Checks {
    
    var name: String

    init(name: String)
        
        {
        
        self.name = name

        
    }
    
    
    
    

    static let exampleChecks = [

        Checks(name: "Weniger Plastik verursachen"),
        Checks(name: "nicht so viel Autofahren"),
        Checks(name: "Bewusster Einkaufen")]
}
