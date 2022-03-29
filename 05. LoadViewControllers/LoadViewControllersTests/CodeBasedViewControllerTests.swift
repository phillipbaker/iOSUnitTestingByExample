//
//  CodeBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Phillip Baker on 5/6/21.
//

import XCTest

@testable import LoadViewControllers
class CodeBasedViewControllerTests: XCTestCase {

    func test_loading() {
        let sut = CodeBasedViewController(data: "DUMMY")
        sut.loadViewIfNeeded()
    }

}
