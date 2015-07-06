//
//  GlanceController.swift
//  CounterWatch WatchKit Extension
//
//  Created by Ivens Denner on 06/07/15.
//  Copyright (c) 2015 Ivens Denner. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    // MARK: - IBOutlets
    @IBOutlet weak var countLabel: WKInterfaceLabel!
    // MARK: -
    
    
    let counter = Counter()
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        counter.retrieve()
        countLabel.setText("\(counter.value)")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
