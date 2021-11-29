//
//  ChangePasswordViewModel.swift
//  Refactoring
//
//  Created by Phillip Baker on 5/18/21.
//

import UIKit

struct ChangePasswordViewModel {
    let okButtonLabel: String
    let enterNewPasswordMessage: String
    let newPasswordTooShortMessage: String
    let confirmationDoesNotMatchMessage: String
    let successMessage: String
    let failureMessage: String
    
    let title = "Change Password"
    let oldPasswordPlaceholder = "Current Password"
    let newPasswordPlaceholder = "New Password"
    let confirmPasswordPlaceholder = "Confirm New Password"
    let submitButtonLabel = "Submit"
    
    var isCancelButtonEnabled = true
    var isBlurViewShowing = false
    var isActivityIndicatorShowing = false
    
    var inputFocus: InputFocus = .noKeyboard
    
    enum InputFocus {
        case noKeyboard
        case oldPassword
        case newPassword
        case confirmPassword
    }
    
    var oldPassword = ""
    var newPassword = ""
    var confirmPassword = ""
    
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
