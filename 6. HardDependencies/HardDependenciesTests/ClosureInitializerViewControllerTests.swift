//
//  ClosureInitializerViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Phillip Baker on 5/7/21.
//

@testable import HardDependencies
import XCTest

class ClosureInitializerViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let sut = ClosureInitializerViewController { Analytics() }
        
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }

}
