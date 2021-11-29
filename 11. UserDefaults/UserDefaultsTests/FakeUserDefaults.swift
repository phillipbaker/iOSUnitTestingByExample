//
//  FakeUserDefaults.swift
//  UserDefaultsTests
//
//  Created by Phillip Baker on 5/11/21.
//

import Foundation
@testable import UserDefaults

class FakeUserDefaults: UserDefaultsProtocol {
    var integers: [String: Int] = [:]
    
    func set(_ value: Int, forKey defaultName: String) {
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        integers[defaultName] ?? 0
    }
    
    
}
