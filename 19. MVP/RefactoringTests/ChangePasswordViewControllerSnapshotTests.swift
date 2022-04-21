//
//  ChangePasswordViewControllerSnapshotTests.swift
//  RefactoringTests
//
//  Created by Phillip Baker on 5/17/21.
//

import XCTest

@testable import Refactoring
import iOSSnapshotTestCase
import ViewControllerPresentationSpy

class ChangePasswordViewControllerSnapshotTests: FBSnapshotTestCase {
    
    // MARK: - Test Fixture
    
    private var sut: ChangePasswordViewController!
    private var passwordChanger: MockPasswordChanger!
    private var alertVerifier: AlertVerifier!
    
    override func setUp() {
        super.setUp()
        recordMode = false
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ChangePasswordViewController.self))
        sut.viewModel = ChangePasswordViewModel(
            okButtonLabel: "OK",
            enterNewPasswordMessage: "Please enter a new password.",
            newPasswordTooShortMessage: "The new password should have at least 6 characters.",
            confirmationDoesNotMatchMessage: "The new password and the confirmation password don’t match. Please try again.",
            successMessage: "Your password has been successfully changed."
        )
        passwordChanger = MockPasswordChanger()
        sut.passwordChanger = passwordChanger
        alertVerifier = AlertVerifier()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop() // Clean out UIWindow
        sut = nil
        passwordChanger = nil
        alertVerifier = nil
        super.tearDown()
    }
    
    // MARK: - Helper Functions
    
    private func setUpValidPasswordEntries() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
    
    // MARK: - Tests
    
    func test_blur() {
        setUpValidPasswordEntries()
        tap(sut.submitButton)
        FBSnapshotVerifyViewController(sut)
    }
}
