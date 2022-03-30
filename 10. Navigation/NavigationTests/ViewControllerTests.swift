//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by Phillip Baker on 5/10/21.
//

@testable import Navigation
import ViewControllerPresentationSpy
import XCTest

class ViewControllerTests: XCTestCase {
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
    
    func test_navigationController_shouldNotBeNil() {
        let _ = UINavigationController(rootViewController: sut)
        XCTAssertNotNil(sut.navigationController)
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
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
    
    func test_tappingCodeModalButton_shouldPresentCodeNextViewController() {
        let presentationVerifier = PresentationVerifier()
        
        tap(sut.codeModalButton)
       
        let codeNextVC: CodeNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
        
        XCTAssertEqual(codeNextVC?.label.text, "Modal from code")
    }
    
    func test_tappingSeguePushButton_shouldShowSegueNextViewController() {
        let presentationVerifier = PresentationVerifier()
        putInWindow(sut)
        
        tap(sut.seguePushButton)
        
        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
        
        XCTAssertEqual(segueNextVC?.labelText, "Pushed from segue")
    }
    
    func test_tappingSegueModalButton_shouldShowSegueNextViewController() {
        let presentationVerifier = PresentationVerifier()
        tap(sut.segueModalButton)
        
        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
        
        XCTAssertEqual(segueNextVC?.labelText, "Modal from segue")
    }
}
