//
//  OverrideViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Phillip Baker on 5/7/21.
//

@testable import HardDependencies
import XCTest

private class TestableOverrideViewController: OverrideViewController {
    override func analytics() -> Analytics {
        Analytics()
    }
}

class OverrideViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let sut = TestableOverrideViewController()
        
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }
    

}
