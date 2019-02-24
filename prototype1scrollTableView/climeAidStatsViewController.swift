//
//  ClimeAidStatsViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 21.01.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit

class ClimeAidStatsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
    
    
    let items = ["1x🐟","10x🐄","34x🦍","1x🦌","8x🦜","34x☘️","23x🐲","197x💐","23x🌴","234x🐲","23x🕊"]

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollCell", for: indexPath) as? StatCollectionViewCell{
            cell.myLabel.text = items[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(items[indexPath.row])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
