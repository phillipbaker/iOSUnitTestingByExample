//
//  Analytics.swift
//  HardDependencies
//
//  Created by Phillip Baker on 5/7/21.
//

import Foundation

class Analytics {
    static let shared = Analytics()
    
    func track(event: String) {
        print(">> " + event)
        
        if self !== Analytics.shared {
            print(">> ...Not the analytics singleton.")
        }
    }
}
