//
//  MainViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit
import Firestore

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var organisationForSegue: Organisations?
    var db: Firestore!
    var orgArray = [Organisations]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        db = Firestore.firestore()
        loadData()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func loadData() {
        db.collection("organisations").getDocuments() {
            querySnapshot, error in
            if let error = error {
                print("\(error.localizedDescription)")
            }else {
                self.orgArray = querySnapshot!.documents.compactMap({Organisations(dictionary: $0.data())})
                DispatchQueue.main.async { //UI update
                
                    self.tableView.reloadData()
                    
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "DetailSegue"{
            
            if let destinationVC = segue.destination as? DetailViewController {
                    destinationVC.organisations = organisationForSegue
                    
                }
            
        }
        
        if segue.identifier == "AdSegue"{
            
            if let destinationVC = segue.destination as? AdViewController {
                destinationVC.org = organisationForSegue
                
            }
            
        }
//                    if segue.identifier == "detailDonateSegue" {
//                         if let destinationViewC = segue.destination as? DetailViewController {
//                            destinationViewC.organisations = organisationForSegue
//
//
//                        }
//
//            }



    }
    
    
    

    }

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orgArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? OrganisationTableViewCell{
          
            cell.configure(for: orgArray[indexPath.row], delegate: self as OrganisationsDelegate) //, delegate: self as OrganisationsDelegate
            return cell
        }
        
        return UITableViewCell()
    }
    

//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return orgArray.count
//    }
    
}
extension MainViewController: OrganisationsDelegate{
    func Button(sender: OrganisationTableViewCell) {
        if let organisations = sender.organisations{
            organisationForSegue = organisations
            performSegue(withIdentifier: "DetailSegue", sender: nil)
        }
    }
    func bigDonateButton(sender: OrganisationTableViewCell){
        if let organisations = sender.organisations{
            organisationForSegue = organisations
            performSegue(withIdentifier: "AdSegue", sender: nil)
        }
    }
    
}


