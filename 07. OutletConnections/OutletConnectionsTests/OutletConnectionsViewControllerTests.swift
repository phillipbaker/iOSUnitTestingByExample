//
//  OutletConnectionsViewControllerTests.swift
//  OutletConnectionsTests
//
//  Created by Phillip Baker on 5/8/21.
//

@testable import OutletConnections
import XCTest

class OutletConnectionsViewControllerTests: XCTestCase {

    func test_outlets_shouldBeConnected() {
        let sut = OutletConnectionsViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.label, "label")
        XCTAssertNotNil(sut.button, "button")
    }

}
