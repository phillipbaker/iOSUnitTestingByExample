//
//  MockPasswordChanger.swift
//  RefactoringUITests
//
//  Created by Phillip Baker on 5/15/21.
//

@testable import Refactoring
import XCTest

final class MockPasswordChanger: PasswordChanging {
    private var changeCallCount = 0
    private var changeArgsSecurityToken: [String] = []
    private var changeArgsOldPassword: [String] = []
    private var changeArgsNewPassword: [String] = []
    private var changeArgsOnSuccess: [() -> Void] = []
    private var changeArgsonFailure: [() -> Void] = []
    
    func change(securityToken: String, oldPassword: String, newPassword: String, onSuccess: @escaping () -> Void, onFailure: @escaping () -> Void) {
        changeCallCount += 1
        changeArgsSecurityToken.append(securityToken)
        changeArgsOldPassword.append(oldPassword)
        changeArgsNewPassword.append(newPassword)
        changeArgsOnSuccess.append(onSuccess)
        changeArgsonFailure.append(onFailure)
    }
    
    func verifyChange(securityToken: String, oldPassword: String, newPassword: String, file: StaticString = #file, line: UInt = #line) {
        guard changeWasCalledOnce(file: file, line: line) else { return }
        XCTAssertEqual(changeArgsSecurityToken.last, securityToken, "security token", file: file, line: line)
        XCTAssertEqual(changeArgsOldPassword.last, oldPassword, "oldPassword", file: file, line: line)
        XCTAssertEqual(changeArgsNewPassword.last, newPassword, "newPassword", file: file, line: line)
    }
    
    func verifyChangeNeverCalled(file: StaticString = #file, line: UInt = #line) {
        changeWasNeverCalled(file: file, line: line)
    }
    
    func changeWasCalledOnce(file: StaticString = #file, line: UInt = #line) -> Bool {
        verifyMethodCalledOnce(methodName: changeMethodName, callCount: changeCallCount, describeArguments: changeMethodArguments, file: file, line: line)
    }
    
    func changeWasNeverCalled(file: StaticString = #file, line: UInt = #line) {
        verifyMethodNeverCalled(methodName: changeMethodName, callCount: changeCallCount, describeArguments: changeMethodArguments, file: file, line: line)
    }
    
    private var changeMethodName: String {
        "change(securityToken:oldPassword:newPassword:onSuccess:onFailure:)"
    }
    
    private var changeMethodArguments: String {
        "oldPasswords: \(changeArgsOldPassword), " + "newPasswords: \(changeArgsNewPassword)"
    }
}


