//
//  ViewController.swift
//  Barta
//
//  Created by apple on 2/4/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
   
    
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        var A = ""
        switch index {
        case 0:
             A = "SearchViewController"
        case 1:
            A = "SportsViewController"
        case 2:
            A = "TravelViewController"
        case 3:
            A = "PoliticsViewController"
        case 4:
            A = "EntertainmentViewController"
        case 5:
            A = "TechNewsViewController"
        default:
            break
        }
       let vc = storyboard?.instantiateViewController(withIdentifier: A)
       return vc!
    }
    
   
    @IBAction func searchButton(_ sender: Any) {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "SViewController") as! SViewController
        self.navigationController?.pushViewController(vc1, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  items = ["Top News","Sports","Travel","Politics","Entertainment","TechNews"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self )
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        carbonTabSwipeNavigation.toolbar.barTintColor = UIColor.black
        
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.orange)
        carbonTabSwipeNavigation.setIndicatorHeight(2)
        carbonTabSwipeNavigation.setTabExtraWidth(16)
        
        carbonTabSwipeNavigation.toolbar.clipsToBounds = true
        carbonTabSwipeNavigation.setSelectedColor(UIColor.white, font: UIFont.systemFont(ofSize: 14))
        carbonTabSwipeNavigation.setNormalColor(UIColor.lightGray, font: UIFont.systemFont(ofSize: 14))
        carbonTabSwipeNavigation.carbonTabSwipeScrollView.bounces = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


    @IBAction func tabTogoNotification(_ sender: Any) {
        
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
               self.navigationController?.pushViewController(vc1, animated: true)
    }
}


