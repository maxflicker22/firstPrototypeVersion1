//
//  OrgStatisticViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 20.01.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit

class OrgStatisticViewController: UIViewController {
    
    
    @IBOutlet weak var StatsImageView: UIImageView!
    @IBOutlet weak var StatsOrgNameLabel: UILabel!
    @IBOutlet weak var Statistik1NameLabel: UILabel!
    @IBOutlet weak var Statistik1WertLabel: UILabel!
    @IBOutlet weak var Statistik2NameLabel: UILabel!
    @IBOutlet weak var Statistik2WertLabel: UILabel!
    @IBOutlet weak var Statistik3NameLabel: UILabel!
    @IBOutlet weak var Statistik3WertLabel: UILabel!
    
    var organisation: Organisations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let org = organisation{
            
            StatsOrgNameLabel.text = org.name
            
            if let image = UIImage(named: org.imageURL) {
            StatsImageView.image = image}
            Statistik1WertLabel.text = "/ \(String(org.totalReach))"
            
        }

        
    }
    


}
