//
//  ChangePasswordViewControllerTests.swift
//  RefactoringTests
//
//  Created by Phillip Baker on 5/15/21.
//

@testable import Refactoring
import XCTest

class ChangePasswordViewControllerTests: XCTestCase {

    // MARK: - Test Stuff
    
    private var sut: ChangePasswordViewController!
    private var passwordChanger: MockPasswordChanger!
//    private var alertVerifier: AlertVerifier!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ChangePasswordViewController.self))
        passwordChanger = MockPasswordChanger()
        sut.passwordChanger = passwordChanger
//        alertVerifier = AlertVerifier()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop() // Clean out UIWindow
        sut = nil
        passwordChanger = nil
//        alertVerifier = nil
        super.tearDown()
    }
    
    
    // MARK: - Helper Functions
    
    private func putFocusOn(_ textField: UITextField) {
        putInViewHierarchy(sut)
        textField.becomeFirstResponder()
    }
    
    private func setUpValidPasswordEntries() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
    
    private func setUpEntriesNewPasswordTooShort() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "12345"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
    
    private func setupMisMatchedConfirmationEntry() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.oldPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = "abcdef"
    }
    
    //    private func verifyAlertPresented(message: String, file: StaticString = #file, line: UInt = #line) {
    //        alertVerifier.verify(title: nil, message: message, animated: true, actions: [.default("OK"),], presentingViewController: sut, file: file, line: line)
    //        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK", "preferredAction", file: file, line: line)
    //    }
    
    // MARK: - Tests
    
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.cancelBarButton, "cancelButton")
        XCTAssertNotNil(sut.oldPasswordTextField, "oldPasswordTextField")
        XCTAssertNotNil(sut.newPasswordTextField, "newPasswordTextField")
        XCTAssertNotNil(sut.confirmPasswordTextField, "confirmPasswordTextField")
        XCTAssertNotNil(sut.submitButton, "submitButton")
        XCTAssertNotNil(sut.navigationBar, "navigationBar")
    }

    func test_navigationBar_shouldHaveTitle() {
        XCTAssertEqual(sut.navigationBar.topItem?.title, "Change Password")
    }
    
    func test_oldPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.oldPasswordTextField.placeholder, "Current Password")
    }
    
    func test_newPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.newPasswordTextField.placeholder, "New Password")
    }
    
    func test_confirmPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.confirmPasswordTextField.placeholder, "Confirm New Password")
    }
    
    func test_oldPasswordTextField_shouldHavePasswordAttributes() {
        let textField = sut.oldPasswordTextField!
        XCTAssertEqual(textField.textContentType, .password, "textContentType")
        XCTAssertTrue(textField.isSecureTextEntry, "isSecureTextEntry")
        XCTAssertTrue(textField.enablesReturnKeyAutomatically, "enablesReturnKeyAutomatically")
    }
    
    func test_newPasswordTextField_shouldHaveNewPasswordAttributes() {
        let textField = sut.newPasswordTextField!
        XCTAssertEqual(textField.textContentType, .newPassword, "textContentType")
        XCTAssertTrue(textField.isSecureTextEntry, "isSecureTextEntry")
        XCTAssertTrue(textField.enablesReturnKeyAutomatically, "enablesReturnKeyAutomatically")
    }
    
    func test_confirmNewPasswordTextField_shouldHaveNewPasswordAttributes() {
        let textField = sut.confirmPasswordTextField!
        XCTAssertEqual(textField.textContentType, .newPassword, "textContentType")
        XCTAssertTrue(textField.isSecureTextEntry, "isSecureTextEntry")
        XCTAssertTrue(textField.enablesReturnKeyAutomatically, "enablesReturnKeyAutomatically")
    }
    
    
    // MARK: - Cancel Bar Button Tests
    
    func test_cancelBarButton_shouldBeSystemItemCancel() {
        XCTAssertEqual(systemItem(for: sut.cancelBarButton), .cancel)
    }
    
    func test_tappingCancel_withFocusOnOldPassword_shouldResignThatFocus() {
        putFocusOn(sut.oldPasswordTextField)
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder, "precondtion")
        
        tap(sut.cancelBarButton)
        
        XCTAssertFalse(sut.oldPasswordTextField.isFirstResponder)
    }
    
    func test_tappingCancel_withFocusOnNewPassword_shouldResignThatFocus() {
        putFocusOn(sut.newPasswordTextField)
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder, "precondition")

        tap(sut.cancelBarButton)
        
        XCTAssertFalse(sut.newPasswordTextField.isFirstResponder)
    }
    
    func test_tappingCancel_withFocusOnConfirmNewPassword_shouldResignThatFocus() {
        putFocusOn(sut.confirmPasswordTextField)
        XCTAssertTrue(sut.confirmPasswordTextField.isFirstResponder, "precondition")
        
        tap(sut.cancelBarButton)
        
        XCTAssertFalse(sut.confirmPasswordTextField.isFirstResponder)
    }
    
//    func test_tappingCancel_shouldDismissModal() {
//        let dismissalVerifier = DismissalVerifer()
//        tap(sut.cancelBarButton)
//        dismissalVerifier.verify(animated: true, dimissedViewController: sut)
//    }

    
    // MARK: - Alert Tests
    
//    func test_tappingOKPasswordBlankAlert_shouldPutFocusOnNewPassword() throws {
//        setUpValidPasswordEntries()
//        sut.newPasswordTextField.text = ""
//
//        tap(sut.submitButton)
//        putInViewHierarchy(sut)
//        try alertVerifier.executeAction(forButton: "OK")
//
//        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
//    }
    
//    func test_tappingOKInTooShortAlert_shouldClearNewAndConfirmation() throws {
//        setUpEntriesNewPasswordTooShort()
//        tap(sut.submitButton)
//
//        try alertVerifier.executeAction(forButton: "OK")
//
//        XCTAssertEqual(sut.newPasswordTextField.text?.isEmpty, true, "new")
//        XCTAssertEqual(sut.confirmPasswordTextField.text?.isEmpty, true, "confirmation")
//    }
    
//    func test_tappingOKInTooShortAlert_shouldNotClearOldPasswordField() throws {
//        setUpEntriesNewPasswordTooShort()
//        tap(sut.submitButton)
//
//        try alertVerifier.executeAction(forButton: "OK")
//
//        XCTAssertEqual(sut.oldPasswordTextField.text?.isEmpty, false)
//    }
    
//    func test_tappingOKInTooShortAlert_shouldPutFocusOnNewPassword() throws {
//        setUpEntriesNewPasswordTooShort()
//        tap(sut.submitButton)
//        putInViewHierarchy(sut)
//
//        try alertVerifier.executeAction(forButton: "OK")
//
//        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
//    }
    
//    func test_tappingOKInMismatchAlert_shouldClearNewAndConfirmation() throws {
//        setupMisMatchedConfirmationEntry()
//        tap(sut.submitButton)
//
//        try alertVerifier.executeAction(forButton: "OK")
//
//        XCTAssertEqual(sut.newPasswordTextField.text?.isEmpty, true, "new")
//        XCTAssertEqual(sut.confirmPasswordTextField.text?.isEmpty, true, "confirmation")
//    }
    
//    func test_tappingOKInMismatchAlert_shouldNotClearOldPasswordField() throws {
//        setupMisMatchedConfirmationEntry()
//        tap(sut.submitButton)
//
//        try alertVerifier.executeAction(forButton: "OK")
//
//        XCTAssertEqual(sut.oldPasswordTextField.text?.isEmpty, false)
//    }
    
//    func test_tappingOKInMismatchAlert_shouldPutFocusOnNewPassword() throws {
//        setupMisMatchedConfirmationEntry()
//        tap(sut.submitButton)
//        putInViewHierarchy(sut)
//
//        try alertVerifier.executeAction(forButton: "OK")
//
//        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
//    }
    
    
    // MARK: - Submit Button Tests
    
    func test_submitButton_shouldHaveTitle() {
        XCTAssertEqual(sut.submitButton.titleLabel?.text, "Submit")
    }
    
    func test_tappingSubmit_withConfirmationMismatch_shouldNotChangePassword() {
        tap(sut.submitButton)
        passwordChanger.verifyChangeNeverCalled()
    }
    
    func test_tappingSubmit_withOldPasswordEmpty_shouldNotChangePassword() {
        setUpValidPasswordEntries()
        sut.oldPasswordTextField.text = ""
        
        tap(sut.submitButton)
        
        passwordChanger.verifyChangeNeverCalled()
    }
    
    func test_tappingSubmit_withOldPasswordEmpty_shouldPutFocusOnOldPassword() {
        setUpValidPasswordEntries()
        sut.oldPasswordTextField.text = ""
        putInViewHierarchy(sut)
        tap(sut.submitButton)
        
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder)
    }
    
    func test_tappingSubmit_withNewPasswordEmpty_shouldNotChangePassword() {
        setUpValidPasswordEntries()
        sut.newPasswordTextField.text = ""
        
        tap(sut.submitButton)
        
        passwordChanger.verifyChangeNeverCalled()
    }
    
    func test_tappingSubmit_withNewPasswordTooShort_shouldNotChangePassword() {
        setUpEntriesNewPasswordTooShort()
        
        tap(sut.submitButton)
        
        passwordChanger.verifyChangeNeverCalled()
    }
    
//    func test_tappingSubmit_withNewPasswordTooShort_shouldShowTooShortAlert() {
//        setUpEntriesNewPasswordTooShort()
//
//        tap(sut.submitButton)
//
//        verifyAlertPresented(message: "The new password should have at least 6 characters.")
//    }
    
//    func test_tappingSubmit_withNewPasswordEmpty_shouldShowPasswordBlankAlert() {
//        setUpValidPasswordEntries()
//        sut.newPasswordTextField.text = ""
//
//        tap(sut.submitButton)
//
//        verifyAlertPresented(message: "Please enter a new password.")
//    }
    
    //    func test_tappingSubmit_withConfirmationMismatch_shouldShowMismatchAlert() {
    //        setupMisMatchedConfirmationEntry()
    //        tap(sut.submitButton)
    //
    //        verifyAlertPresented(message: "The new password and the confirmation password " + "don’t match. Please try again.")
    //    }
    
    func test_tappingSubmit_withValidFields_FocusedOnOldPassword_resignsFocus() {
        setUpValidPasswordEntries()
        putFocusOn(sut.oldPasswordTextField)
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder, "precondition")
        
        tap(sut.submitButton)
        
        XCTAssertFalse(sut.oldPasswordTextField.isFirstResponder)
    }
    
    func test_tappingSubmit_withValidFields_FocusedOnNewPassword_resignsFocus() {
        setUpValidPasswordEntries()
        putFocusOn(sut.newPasswordTextField)
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder, "precondition")
        
        tap(sut.submitButton)
        
        XCTAssertFalse(sut.newPasswordTextField.isFirstResponder)
    }
    
    func test_tappingSubmit_withValidFields_FocusedOnConfirmNewPassword_resignsFocus() {
        setUpValidPasswordEntries()
        putFocusOn(sut.confirmPasswordTextField)
        XCTAssertTrue(sut.confirmPasswordTextField.isFirstResponder, "precondition")
        
        tap(sut.submitButton)
        
        XCTAssertFalse(sut.confirmPasswordTextField.isFirstResponder)
    }
    
    func test_tappingSubmit_withValidFields_shouldShowBlurView() {
        setUpValidPasswordEntries()
        XCTAssertNil(sut.blurView.superview, "precondition")
        
        tap(sut.submitButton)
        
        XCTAssertNotNil(sut.blurView.superview)
    }
    
    func test_tappingSubmit_withValidFields_shouldShowActivityIndicator() {
        setUpValidPasswordEntries()
        XCTAssertNil(sut.activityIndicator.superview, "precondition")
        
        tap(sut.submitButton)
        
        XCTAssertNotNil(sut.activityIndicator.superview)
    }
    
    func test_tappingSubmit_withValidFields_shouldStartActivityAnimation() {
        setUpValidPasswordEntries()
        XCTAssertFalse(sut.activityIndicator.isAnimating, "precondition")
        
        tap(sut.submitButton)
        
        XCTAssertTrue(sut.activityIndicator.isAnimating)
    }
    
    func test_tappingSubmit_withValidFields_shouldDisableCancelBarButton() {
        setUpValidPasswordEntries()
        XCTAssertTrue(sut.cancelBarButton.isEnabled, "precondition")
        
        tap(sut.submitButton)
        
        XCTAssertFalse(sut.cancelBarButton.isEnabled)
    }
    
    func test_tappingSubmit_withValidFields_shouldClearBackgroundColorForBlur() {
        setUpValidPasswordEntries()
        XCTAssertNotEqual(sut.view.backgroundColor, .clear, "precondition")
        
        tap(sut.submitButton)
        
        XCTAssertEqual(sut.view.backgroundColor, .clear)
    }
    
    
    // MARK: - TextField Delegate Tests
    
    func test_textFieldDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.oldPasswordTextField.delegate, "oldPasswordTextField")
        XCTAssertNotNil(sut.newPasswordTextField.delegate, "newPasswordTextField")
        XCTAssertNotNil(sut.confirmPasswordTextField.delegate,"confirmPasswordTextField")
    }
    
    func test_hittingReturnFromOldPassword_shouldPutFocusOnNewPassword() {
        putInViewHierarchy(sut)
        
        shouldReturn(in: sut.oldPasswordTextField)
        
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
    }
    
    func test_hittingReturnFromNewPassword_shouldPutFocusOnConfirmPassword() {
        putInViewHierarchy(sut)
        
        shouldReturn(in: sut.newPasswordTextField)
        
        XCTAssertTrue(sut.confirmPasswordTextField.isFirstResponder)
    }
    
    func test_hittingReturnFromConfirmPassword_shouldRequestPasswordChange() {
        sut.securityToken = "TOKEN"
        sut.oldPasswordTextField.text = "OLD456"
        sut.newPasswordTextField.text = "NEW456"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
        
        shouldReturn(in: sut.confirmPasswordTextField)
        
        passwordChanger.verifyChange(securityToken: "TOKEN", oldPassword: "OLD456", newPassword: "NEW456")
    }
    
    func test_hittingReturnFromOldPassword_shouldNotRequestPasswordChange() {
        setUpValidPasswordEntries()
        
        shouldReturn(in: sut.oldPasswordTextField)
        
        passwordChanger.verifyChangeNeverCalled()
    }
    
    func test_hittingReturnFromNewPassword_shouldNotRequestPasswordChange() {
        setUpValidPasswordEntries()
        
        shouldReturn(in: sut.newPasswordTextField)
        
        passwordChanger.verifyChangeNeverCalled()
    }
}
