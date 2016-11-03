//
//  ViewController.swift
//  Local Notification
//
//  Created by don't touch me on 11/3/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UNUserNotificationCenter manages the notification-related activitis
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (success, error) in
            
            if success {
                print("success")
            } else {
                print("error")
            }
        }
        
    }
    
    @IBAction func sendNotification(_ sender: UIButton) {
        
        //1 the UNMutableNotificationContent object contains the data of the notification
        let content = UNMutableNotificationContent()
        content.title = "Notification Tutorial"
        content.subtitle = "from trvl"
        content.body = "Notification triggered"
        
        //2 the UNNotificationAttachment object contains the media content of the notification
        let imageName = "applelogo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        
        content.attachments = [attachment]
        
        //3 an UNNotificationRequest is generated which will trigger at the timeinterval of 10 secs
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        //4 the notification is scheduled for delivery 
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
    }
    

    

}

