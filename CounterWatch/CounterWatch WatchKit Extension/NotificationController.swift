//
//  NotificationController.swift
//  CounterWatch WatchKit Extension
//
//  Created by Ivens Denner on 06/07/15.
//  Copyright (c) 2015 Ivens Denner. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var alertMessage: WKInterfaceLabel!
    @IBOutlet weak var countLabel: WKInterfaceLabel!
    // MARK: -
    
    
    let counter = Counter()
    

    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
        
        counter.retrieve()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    /*
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */
    

    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        if let remoteAps = remoteNotification["aps"] as? NSDictionary, remoteAlert = remoteAps["alert"] as? NSDictionary {
            alertMessage.setText(remoteAlert["body"] as? String)
            counter.increase()
            countLabel.setText("\(counter.value)")
        }
        
        completionHandler(.Custom)
    }

}
