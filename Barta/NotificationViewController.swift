//
//  NotificationViewController.swift
//  Barta
//
//  Created by apple on 2/6/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import UserNotifications
class NotificationViewController: UIViewController,UNUserNotificationCenterDelegate {
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }

    }
    

    func sendNotification() {
       let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Test"
        notificationContent.body = "Test body"
        notificationContent.badge = NSNumber(value: 3)
        
        if let url = Bundle.main.url(forResource: "dune",
                                    withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                            url: url,
                                                            options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2,
                                                        repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
        
        
    }
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    
    
    @IBAction func prothomAlo(_ sender: Any) {
         let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.address = "https://www.prothomalo.com"
                      self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dailyStar(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
         vc.address = "https://www.thedailystar.net"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bdNews(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
         vc.address = "http://bdnew24.com"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func bbc(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
         vc.address = "https://www.bbc.com"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        b1.layer.borderColor = UIColor.black.cgColor
        b1.layer.borderWidth = 2
               b1.layer.cornerRadius = 10
        b2.layer.borderColor = UIColor.black.cgColor
        b2.layer.borderWidth = 2
               b2.layer.cornerRadius = 10
        b3.layer.borderColor = UIColor.black.cgColor
        b3.layer.borderWidth = 2
               b3.layer.cornerRadius = 10
        b4.layer.borderColor = UIColor.black.cgColor
        b4.layer.borderWidth = 2
               b4.layer.cornerRadius = 10
        
        self.userNotificationCenter.delegate = self

        self.requestNotificationAuthorization()
        self.sendNotification()
        self.navigationItem.title = "Notification"
        
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }

}

