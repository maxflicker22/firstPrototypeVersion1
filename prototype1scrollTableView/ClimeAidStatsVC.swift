//
//  ClimeAidStatsViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 21.01.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit


class ClimeAidStatsVC: UIViewController{
    
    
  
    @IBOutlet weak var gesamtPunkteLabel: UILabel!
    
  
    var orgArray: [Organisations] = []
//    let items = ["1x🐟","10x🐄","34x🦍","1x🦌","8x🦜","34x☘️","23x🐲","197x💐","23x🌴","234x🐲","23x🕊"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gesamtPunkteLabel.text = String(punkteGesamt(orgArray: orgArray))
        // Do any additional setup after loading the view.
    }
   
    
    func punkteGesamt(orgArray: [Organisations]) -> Int{
        var gesamtPunkte: Int = 0
        for points in orgArray{
            gesamtPunkte = gesamtPunkte + points.gesamtZahl
        }
        return gesamtPunkte
        
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

extension ClimeAidStatsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollCell", for: indexPath) as? StatCollectionViewCell{
            cell.myLabel.text = orgArray[indexPath.row].name
            
            return cell
        }
        
        return UICollectionViewCell()
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(orgArray[indexPath.row].name)
    }
}


