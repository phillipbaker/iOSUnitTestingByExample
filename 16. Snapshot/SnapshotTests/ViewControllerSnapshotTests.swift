//
//  ViewControllerSnapshotTests.swift
//  SnapshotTests
//
//  Created by Phillip Baker on 3/30/22.
//

@testable import Snapshot
import iOSSnapshotTestCase

class ViewControllerSnapshotTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func test_example() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        FBSnapshotVerifyViewController(sut)
    }
}
