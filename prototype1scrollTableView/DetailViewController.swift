//
//  DetailViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit
import Foundation
protocol DetailOrganisationsDelegate{
    func donateButton(sender: OrganisationTableViewCell)
    
}

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
    var delegate: DetailOrganisationsDelegate?

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailDonateSegue" {
             if let destinationViewC = segue.destination as? AdViewController, let org = organisations {
                destinationViewC.org = org
                

            }
        }
    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let org = organisations{ //sicher unwrappen
            detailName.text = org.name
           
            
            if let image = UIImage(named: org.imageURL) {
                            detailImageView.image = image}
            detailtotalReach.text = "/ \(String(org.totalReach))"
            detailActuallyReach.text = String(org.actuallyReach)
//            detailDescription.text = org.description
//            detailUserAnzahl.text = String(org.userAnzahl)
            detailGesamtZahl.text = String(org.gesamtZahl)
//            detailUserName.text = "\(org.userName):"
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
    
    
    @IBAction func donateButton(_ sender: UIButton) {
        performSegue(withIdentifier: "detailDonateSegue", sender: self)
        
        
    }
    
}
