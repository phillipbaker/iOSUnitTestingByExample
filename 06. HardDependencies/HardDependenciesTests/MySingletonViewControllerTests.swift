//
//  MySingletonViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Phillip Baker on 5/7/21.
//

@testable import HardDependencies
import XCTest

class MySingletonViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        MySingletonAnalytics.stubbedInstance = MySingletonAnalytics()
    }
    
    override func tearDown() {
        MySingletonAnalytics.stubbedInstance = nil
        super.tearDown()
    }
    
    func test_viewDidAppear() {
        let sut = MySingletonViewController()
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }

}
