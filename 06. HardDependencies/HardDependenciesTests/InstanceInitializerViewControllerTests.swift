//
//  InstanceInitializerViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Phillip Baker on 5/7/21.
//

@testable import HardDependencies
import XCTest

class InstanceInitializerViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let sut = InstanceInitializerViewController(analytics: Analytics())
        
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }

}
