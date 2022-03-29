//
//  ViewControllerTests.swift
//  ButtonTapTests
//
//  Created by Phillip Baker on 5/9/21.
//

@testable import ButtonTap
import XCTest

class ViewControllerTests: XCTestCase {

    func test_tappingButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        
        sut.loadViewIfNeeded()
        tap(sut.button)
    }

}
