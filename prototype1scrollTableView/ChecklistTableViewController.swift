//
//  ChecklistTableViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 18.01.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit

class ChecklistTableViewController: UITableViewController {
    
    var checks: [Checks] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let plastik = Checks(name: "Weniger Plastik")
        checks.append(plastik)
     

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return checks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath)
        let check = checks[indexPath.row]
        cell.textLabel?.text = check.name
       // print(check.name)

        // Configure the cell...

        return cell
    }
    

}
