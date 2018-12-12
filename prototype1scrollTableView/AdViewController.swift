//
//  AdViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit

class AdViewController: UIViewController {
    
    @IBOutlet weak var appAdLabel: UILabel!
    
    var org: Organisations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let organisation = org{ //sicher unwrappen
            
            
            print(organisation.name)
        }
        }
        // Do any additional setup after loading the view.
    }
    



