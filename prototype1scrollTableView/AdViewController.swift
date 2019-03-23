//
//  AdViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit
import Firestore
import Firebase




class AdViewController: UIViewController, GADRewardBasedVideoAdDelegate{
    
   
    
    @IBOutlet weak var adTextLabel: UILabel!
    var adViewController: AdViewController?
    
    var org: Organisations?
    var user: User?
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
   
    func updateUserData(){
       
        db = Firestore.firestore()
        if let userid = Auth.auth().currentUser?.uid {
        let DocRef = db.collection("users").document(userid)
            DocRef.getDocument { (document, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = document?.data()
                    {
                    self.user = User(dictionary: data)
//                        let points = self.user?.punkte
//                        print(self.user?.punkte)
                        guard let points = self.user?.punkte else { print("waaaat"); return}
//                        if let p = points {
                        self.user?.punkte = points + self.adCounter
                        guard var array = self.user?.orgArr else {return}
                        guard let organisations = self.org else {return}
                        
                        //überprüfen ob wert in array doppelt ist
                       let check = FirestoreFunc.instance.arrayValueDouble(array: array, string: organisations.name)
                        
                        if check == false {
                            array.append(organisations.name)
                        }
                        self.user?.orgArr = array
                        
                        
                        
//                        print(self.user?.userToDictonary())
                        DocRef.setData(self.user!.userToDictonary()){
////                        guard let p = self.user?.punkte else { return}
//                        DocRef.updateData([
////                            "orgArr":  FieldValue.arrayUnion(["greater_virginia"]),
//
////                            SDK suchen!!!!!!
//                            "punkte" : p
//
//                            ])
                             err in
                            if let err = err {
                                print("Error updating document: \(err)")
                            } else {
                                print("Document successfully updated")
                            }
                        }
//                            print("userdataupdated")
//                        }
                        
                    }
                }
                
        }
    }
    
    }
    @IBAction func closeSwipe(_ sender: Any) {
        print("close")
//        updateData()
        updateOrgDataTransaction()
        updateUserData()
        
        
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
    
    
    
    
    func updateOrgDataTransaction() {
        guard let organisations = org else { return}
        db = Firestore.firestore()
//        if let userid = Auth.auth().currentUser?.uid {
            let DocRef = db.collection("organisations").document(organisations.name)
         
            db.runTransaction({ (transaction, errorPointer) -> Any? in
                
                let sfDocument: DocumentSnapshot
                do {
                    try sfDocument = transaction.getDocument(DocRef)
                } catch let fetchError as NSError {
                    errorPointer?.pointee = fetchError
                    return nil
                }
                guard let oldPunkte = sfDocument.data()["gesamtZahl"] as? Int else{
                    let error = NSError(
                        domain: "AppErrorDomain",
                        code: -1,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Unable to retrieve population from snapshot \(sfDocument)"
                        ]
                    )
                    errorPointer?.pointee = error
                    return nil
                }
                let newPunkte = oldPunkte + self.adCounter
                
                transaction.updateData(["gesamtZahl": newPunkte]
                    , forDocument: DocRef)
                
                return newPunkte
            
            })
            { (object, error) in
                if let error = error {
                    print("Error updating population: \(error)")
                } else {
                    print("punkte org increased to \(object!)")
                }
            }
            
            
            
            
        }
        
        
//    }
}








        
        // Do any additional setup after loading the view.

    



