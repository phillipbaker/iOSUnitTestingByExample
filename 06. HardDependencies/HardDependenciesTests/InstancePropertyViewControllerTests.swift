//
//  InstancePropertyViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Phillip Baker on 5/7/21.
//

@testable import HardDependencies
import XCTest

class InstancePropertyViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: InstancePropertyViewController = storyboard.instantiateViewController(identifier: String(describing: InstancePropertyViewController.self))
        
        sut.analytics = Analytics()
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }

}
