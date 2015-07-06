//
//  Counter.swift
//  CounterWatch
//
//  Created by Ivens Denner on 06/07/15.
//  Copyright (c) 2015 Ivens Denner. All rights reserved.
//

import UIKit

class Counter {
    
    private (set) var value = 0
    
    func save() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(value, forKey: "WatchKitCounter")
    }
    
    func retrieve() {
        let defaults = NSUserDefaults.standardUserDefaults()
        value = defaults.integerForKey("WatchKitCounter")
    }
    
    func increase() {
        value++
        save()
    }
    
    func erase() {
        value = 0
        save()
    }

}
