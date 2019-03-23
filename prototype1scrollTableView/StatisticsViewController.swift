//
//  StatisticsViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 20.01.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit
import Firestore

class StatisticsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoButton: UIButton!
    //    @IBOutlet weak var statisticsTV: UITableView!
    
    var organisation: Organisations?
    var db: Firestore!
    var orgArray = [Organisations]()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        db = Firestore.firestore()
        loadOrgArray()
        
    }
    
//    func loadData() {
//        db.collection("organisations").getDocuments() {
//            querySnapshot, error in
//            if let error = error {
//                print("\(error.localizedDescription)")
//            }else {
//                self.orgArray = querySnapshot!.documents.compactMap({Organisations(dictionary: $0.data())})
//                DispatchQueue.main.async { //UI update
//                    self.tableView.reloadData()
//                }
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StatCellSegue" {
            if let destinationViewController = segue.destination as? OrgStatisticViewController  {
                destinationViewController.organisation = organisation
            }
        }
        if segue.identifier == "CAStatsSegue" {
            if let destinationViewController = segue.destination as? ClimeAidStatsVC  {
                destinationViewController.orgArray = orgArray
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orgArray.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "StatsCell", for: indexPath)as? StatisticsTableViewCell{
            cell.textLabel?.text = orgArray[indexPath.row].name
            
            
            
            
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        organisation = orgArray[indexPath.row]
        performSegue(withIdentifier: "StatCellSegue", sender: self)

    }
    
    @IBAction func CAStatsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "CAStatsSegue", sender: self)
    }
    
    
}


extension StatisticsViewController: loadDataOrgArray{
    func loadOrgArray(){
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
    
}
