//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by Phillip Baker on 5/10/21.
//

@testable import Navigation
import XCTest

class ViewControllerTests: XCTestCase {
    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()
        let navigation = UINavigationController(rootViewController: sut)
        
        tap(sut.codePushButton)
        executeRunLoop()
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
        
        let pushedVC = navigation.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, " + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed from code")
    }
    
    func test_INCORRECT_tappingCodeModalButton_shouldPresentCodeNextViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        sut.loadViewIfNeeded()
        
        UIApplication.shared.windows.first?.rootViewController = sut
        
        tap(sut.codeModalButton)
        
        let presentedVC = sut.presentedViewController
        guard let codeNextVC = presentedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, " + "but was \(String(describing: presentedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Modal from code")
    }
}
