//
//  AssertYourselfTests.swift
//  AssertYourselfTests
//
//  Created by Phillip Baker on 5/3/21.
//

import XCTest
@testable import AssertYourself

class AssertYourselfTests: XCTestCase {

    func test_assertEqual_withOptional() {
        let result: String? = "foo"
        XCTAssertEqual(result, "bar")
    }

}
