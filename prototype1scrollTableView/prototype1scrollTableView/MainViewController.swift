//
//  MainViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var organisationForSegue: Organisations?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "DetailSegue"{
            if let detailViewControler = segue.destination as? DetailViewController, let organisation = organisationForSegue {
                //detailViewControler.name = organisation.name


            }
        }
    }
    

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? OrganisationTableViewCell{
            cell.configure(for: Organisations.exampleOrganisations[indexPath.section], delegate: self as OrganisationsDelegate) //
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Organisations.exampleOrganisations.count
    }
    
}
extension MainViewController: OrganisationsDelegate{
    func detailButtontapped(sender: OrganisationTableViewCell) {
        if let organisations = sender.organisations{
            organisationForSegue = organisations
            performSegue(withIdentifier: "DetailSegue", sender: nil)
        }
    }
}
