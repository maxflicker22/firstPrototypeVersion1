//
//  AdViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit
import Firebase


class AdViewController: UIViewController, GADRewardBasedVideoAdDelegate{
    
   
    
    @IBOutlet weak var adTextLabel: UILabel!
    var adViewController: AdViewController?
    
    
    
    
    var rewardBasedVideoRequest = false
    fileprivate var rewardBasedAd: GADRewardBasedVideoAd?
    var lableText: String = "Please Wait"
    

    
    
    @IBAction func startAdButton(_ sender: Any) {
        if rewardBasedAd?.isReady == true {
            rewardBasedAd?.present(fromRootViewController: self)
        } else {
            creatAndLoadVideoAd()
        }
    }
    var org: Organisations?
    
    func creatAndLoadVideoAd() {
        rewardBasedAd = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedAd?.delegate = self
        rewardBasedAd?.load(GADRequest(), withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let organisation = org{ //sicher unwrappen
            print("asf")
            print("view did Load!")
            
            print(organisation.name)
            adTextLabel.text = lableText
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        creatAndLoadVideoAd()
          print("view did appear!")
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
        creatAndLoadVideoAd()
    }
}

    
        
        // Do any additional setup after loading the view.

    



