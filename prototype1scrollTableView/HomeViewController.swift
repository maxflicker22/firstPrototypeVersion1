//
//  HomeViewController.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 17.02.19.
//  Copyright © 2019 Worldcare. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
   private var pageViewController: UIPageViewController!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBAction func signInButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signInVC")
        self.present(vc, animated: true, completion: nil)
        
//        let controller = storyboard.instantiateViewController(withIdentifier: "signInVC")
        

    }
    @IBAction func logInButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "logInVC")
        self.present(vc, animated: true, completion: nil)
    }
    
    private lazy var viewControllers: [UIViewController] = {
        var viewControllers = [UIViewController]()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "1")
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "2")
        viewControllers.append(firstViewController)
        viewControllers.append(secondViewController)
        return viewControllers
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let user = Auth.auth().currentUser {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
//            self.dismiss(animated: true, completion: nil)
//            self.present(vc, animated: false, completion: nil)
//
//        }
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
//         self.tabBarController?.tabBar.isHidden = true

    
//        if let user = Auth.auth().currentUser {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
//            self.dismiss(animated: true, completion: nil)
//            self.present(vc, animated: false, completion: nil)
//        }
        
        //irgendwas haut mit den segues nicht hin. (NavigationController problem, eventuell noch mal von vorne machen.
        //Sigbert kommt wenn man neuen simulatorstarten und danach auf registrieren und nochmal aufs tabbar item drückt
        //erst nach registrierung und danach nochmal auf bar item gedrückt -> sigbert
        //vlt navigationstack löschen oder ohne navaigationcontroller programmiern
        
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? UIPageViewController {
            pageViewController = vc
            pageViewController.dataSource = self
            pageViewController.delegate = self
            pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
            
        }
    }

}
extension HomeViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = viewControllers.lastIndex(of: viewController){
            let newIndex = index - 1
            if newIndex < 0 {
                return nil
            } else {
                return viewControllers[newIndex]
            }
            
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = viewControllers.lastIndex(of: viewController){
            let newIndex = index + 1
            if newIndex >= viewControllers.count{
                return nil
            } else {
                return viewControllers[newIndex]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed{
            if let viewController = pageViewController.viewControllers?.first{
                if let index = viewControllers.lastIndex(of: viewController) {
                    //                    title = titles[index]
                    pageControl.currentPage = index
                }
            }
        }
    }
    
    
    
    
}
