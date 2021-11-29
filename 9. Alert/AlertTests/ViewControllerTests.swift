//
//  ViewControllerTests.swift
//  AlertTests
//
//  Created by Phillip Baker on 5/10/21.
//

@testable import Alert
import ViewControllerPresentationSpy
import XCTest

class ViewControllerTests: XCTestCase {

    func test_buttonTap() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        
        sut.loadViewIfNeeded()
        
        tap(sut.button)
    }

}
