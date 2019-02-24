//
//  profilViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 17.02.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit
import Firebase

class profilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.tabBarController?.tabBar.isHidden = false
//        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
    }
    @IBAction func logoutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        print("ausgeloggt")
        
//        self.performSegue(withIdentifier: "toHomeSegue", sender: self)
        self.dismiss(animated: false, completion: nil)
        
        
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
