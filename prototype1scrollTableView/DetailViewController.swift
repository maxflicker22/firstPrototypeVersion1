//
//  DetailViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!

    @IBOutlet weak var detailName: UILabel!
    
    @IBOutlet weak var detailGesamtZahl: UILabel!

    @IBOutlet weak var detailProgressView: UIProgressView!

    @IBOutlet weak var detailtotalReach: UILabel!

    @IBOutlet weak var detailActuallyReach: UILabel!

    @IBOutlet weak var detailUserName: UILabel!

    @IBOutlet weak var detailUserAnzahl: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    
    
    var organisations: Organisations?


    
    
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let org = organisations{ //sicher unwrappen
            detailName.text = org.name
            print(org.name)
            
            if let image = UIImage(named: org.imageURL) {
                            detailImageView.image = image}
            detailtotalReach.text = "/ \(String(org.totalReach))"
            detailActuallyReach.text = String(org.actuallyReach)
//            detailUserName.text = org.userName
//            detailGesamtZahl.text = String(org.gesamtZahl)
//            detailDescription.text = org.description
            //detailUserAnzahl.text = String(org.userAnzahl)
            
            
            
        }
//            detailUserName.text = "asf"
//
     
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//
//    }
    
    

//extension DetailViewController: OrganisationsDelegate{
//
//    func Button(sender: OrganisationTableViewCell){
//        configureDetail(for: sender.organisations)
//    }
//
//}

}
