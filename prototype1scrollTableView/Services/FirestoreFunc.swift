//
//  FirestoreFunc.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 20.03.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import Foundation
import Firestore


class FirestoreFunc {
    
    private static let _instance = FirestoreFunc()
    
    static var instance: FirestoreFunc {
        return _instance
    }
    
    var db: Firestore!
   
    
    
    
func arrayValueDouble(array: [String], string: String) -> Bool{
    
    var isDouble = false
    
    for value in array {
        if value == string {
            isDouble = true
            break
        }
    }
    
    return isDouble
    }

//    func loadDataOrgArray(tableview: UITableView!) -> [Organisations] {
//
//        var orgArray: [Organisations]
//        db.collection("organisations").getDocuments() {
//            querySnapshot, error in
//            if let error = error {
//                print("\(error.localizedDescription)")
//            }else {
//                orgArray = querySnapshot!.documents.compactMap({Organisations(dictionary: $0.data())})
//                DispatchQueue.main.async { //UI update
//                    tableview.reloadData()
//                }
//            }
//        }
//        return orgArray
//    }
    
 

    
    
}

protocol loadDataOrgArray {
    func loadOrgArray()
    
}
