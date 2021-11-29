//
//  GreeterTests.swift
//  TDDTests
//
//  Created by Phillip Baker on 5/23/21.
//

import XCTest
@testable import TDD

final class GreeterWithoutNameTests: XCTestCase {

    private var sut: Greeter!
    
    override func setUp() {
        super.setUp()
        sut = Greeter(name: "")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_greet_with1159am_shouldSayGoodMorning() {
        let result = sut.greet(time: date(hour: 11, minute: 59))
        
        XCTAssertEqual(result, "Good morning")
    }
    
    func test_greet_with0500am_shouldSayGoodMorning() {
        let result = sut.greet(time: date(hour: 5, minute: 0))
        
        XCTAssertEqual(result, "Good morning")
    }
    
    func test_greet_with0800am_shouldSayGoodMorning() {
        let result = sut.greet(time: date(hour: 8, minute: 0))
        
        XCTAssertEqual(result, "Good morning")
    }
    
    func test_greet_with1200pm_shouldSayGoodAfternoon() {
        let result = sut.greet(time: date(hour: 12, minute: 00))
        
        XCTAssertEqual(result, "Good afternoon")
    }
    
    func test_greet_with0459pm_shouldSayGoodAfternoon() {
        let result = sut.greet(time: date(hour: 16, minute: 59))
        
        XCTAssertEqual(result, "Good afternoon")
    }
    
    func test_greet_with0500pm_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 17, minute: 00))
        
        XCTAssertEqual(result, "Good evening")
    }
    
    func test_greet_with0800pm_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 20, minute: 00))
        
        XCTAssertEqual(result, "Good evening")
    }
    
    func test_greet_with1159pm_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 23, minute: 59))
        
        XCTAssertEqual(result, "Good evening")
    }
    
    func test_greet_with1200am_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 00, minute: 00))
        
        XCTAssertEqual(result, "Good evening")
    }
    
    func test_greet_with0200am_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 2, minute: 00))
        
        XCTAssertEqual(result, "Good evening")
    }
    
    func test_greet_with0459am_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 4, minute: 59))
        
        XCTAssertEqual(result, "Good evening")
    }
}

final class GreeterWithNameTests: XCTestCase {
    func test_greetMorning_withAlberto_shouldSayGoodMorningAlberto() {
        let sut = Greeter(name: "Alberto")
        
        let result = sut.greet(time: date(hour: 5, minute: 0))
        
        XCTAssertEqual(result, "Good morning, Alberto.")
    }
}

private func date(hour: Int, minute: Int) -> Date {
    let components = DateComponents(calendar: Calendar.current, hour: hour, minute: minute)
    return components.date!
}
