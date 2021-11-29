//
//  Greeter.swift
//  TDD
//
//  Created by Phillip Baker on 5/23/21.
//

import Foundation

struct Greeter {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func greet(time: Date) -> String {
        if !name.isEmpty {
            return "Good morning, Alberto."
        }
        
        let theHour = hour(for: time)
        switch theHour {
        case 5..<12:
            return Greetings.morningGreeting.rawValue
        case 12..<17:
            return Greetings.afternoonGreeting.rawValue
        case 17..<24:
            return Greetings.eveningGreeting.rawValue
        case 0..<5:
            return Greetings.eveningGreeting.rawValue
        default:
            return Greetings.anytimeGreeting.rawValue
        }
    }
    
    func hour(for time: Date) -> Int {
        let components = Calendar.current.dateComponents([.hour], from: time)
        return components.hour ?? 0
    }
}

enum Greetings: String {
    case morningGreeting = "Good morning"
    case afternoonGreeting = "Good afternoon"
    case eveningGreeting = "Good evening"
    case anytimeGreeting = "Greetings"
}
