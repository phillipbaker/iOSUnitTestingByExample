//
//  XIBBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Phillip Baker on 5/6/21.
//

@testable import LoadViewControllers
import XCTest

class XIBBasedViewControllerTests: XCTestCase {

    func test_loading() {
        let sut = XIBBasedViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.label)
    }

}
