//
//  AdViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit
import Firebase
import Firestore


class AdViewController: UIViewController, GADRewardBasedVideoAdDelegate{
    
   
    
    @IBOutlet weak var adTextLabel: UILabel!
    var adViewController: AdViewController?
    
    var org: Organisations?
     var db: Firestore!
    
    var adCounter:Int = 0
    
    var newOrg: Organisations?
    
    
    
    var rewardBasedVideoRequest = false
    fileprivate var rewardBasedAd: GADRewardBasedVideoAd?
    var lableText: String = "Please Wait"
    
    
    func updateData(){
        
        db = Firestore.firestore()
        if let organisation = org {
            let DocRef = db.collection("organisations").document(organisation.name)
                DocRef.getDocument { (document, error) in
                if let error = error {
                  print(error.localizedDescription)
                }else {

                    self.newOrg = Organisations(dictionary: (document!.data()))
                    if let gesamtZahl = self.newOrg?.gesamtZahl{
                        self.newOrg?.gesamtZahl = gesamtZahl + self.adCounter
                        
                        DocRef.setData(self.newOrg!.dictionary)
                        
                        print("updated")
                        
                
                }
            }
        }
        
       
    }
        
    }
    

    @IBAction func closeSwipe(_ sender: Any) {
        print("close")
        updateData()
        
        _ = Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
//        self.navigationController?.popViewController(animated: true)
  
            
       
        
       
        

    }
    @objc func timerAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func startAdButton(_ sender: Any) {
        if rewardBasedAd?.isReady == true {
            rewardBasedAd?.present(fromRootViewController: self)
        } else {
            creatAndLoadVideoAd()
        }
    }
   
    
    func creatAndLoadVideoAd() {
        rewardBasedAd = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedAd?.delegate = self
        rewardBasedAd?.load(GADRequest(), withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adTextLabel.text = lableText
        
        if let organisation = org{ //sicher unwrappen
            print("asf")
            print("view did Load!")
            
            print(organisation.name)
           
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        creatAndLoadVideoAd()
          print("view did appear!")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("disapear")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        print("Error : \(error.localizedDescription)")
    }
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("did complete playing")
    }
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("will leave application")
    }
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
         print("did close")
    }
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
          print("did start playing")
    }
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
          print("did open video ad")
    }
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
         print("did receive video ad")
        
        lableText = "Tap to Donate!"
        adTextLabel.text = lableText
        
        
    }
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
         print("Du erhältst currency:  \(reward.type), amount: \(reward.amount)")
//        lableText = "Please Wait"
        adTextLabel.text = " +\(reward.amount)"
        print(adCounter)
        adCounter = adCounter + 1
        print(adCounter)
        creatAndLoadVideoAd()
    }
}

    
        
        // Do any additional setup after loading the view.

    



