//
//  MyClassTests.swift
//  LifeCycleTests
//
//  Created by Phillip Baker on 5/4/21.
//

import XCTest
@testable import LifeCycle

class MyClassTests: XCTestCase {
    private var sut: MyClass!
    
    override func setUp() {
        super.setUp()
        sut = MyClass()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_methodOne() {
        sut.methodOne()
    }
    
    func test_methodTwo() {
        sut.methodTwo()
    }
}
