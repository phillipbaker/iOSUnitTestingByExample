//
//  PasswordInputs.swift
//  Refactoring
//
//  Created by Phillip Baker on 5/23/21.
//

import Foundation

struct PasswordInputs {
    let oldPassword: String
    let newPassword: String
    let confirmPassword: String
    
    var isOldPasswordEmpty: Bool {
        oldPassword.isEmpty
    }
    
    var isNewPasswordEmpty: Bool {
        newPassword.isEmpty
    }
    
    var isNewPasswordTooShort: Bool {
        newPassword.count < 6
    }
    
    var isConfirmPasswordMismatched: Bool {
        confirmPassword != newPassword
    }
}
