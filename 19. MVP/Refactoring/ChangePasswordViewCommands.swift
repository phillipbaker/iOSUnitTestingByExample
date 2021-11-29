//
//  ChangePasswordViewCommands.swift
//  Refactoring
//
//  Created by Phillip Baker on 5/21/21.
//

import Foundation

protocol ChangePasswordViewCommands: AnyObject {
    func setCancelButtonEnabled(_ enabled: Bool)
    func updateInputFocus(_ inputFocus: InputFocus)
    func showBlurView()
    func hideBlurView()
    func showActivityIndicator()
    func hideActivityIndicator()
    func dismissModal()
    func clearAllPasswordFields()
    func clearNewPasswordFields()
    func showAlert(message: String, action: @escaping () -> Void)
}

enum InputFocus {
    case noKeyboard
    case oldPassword
    case newPassword
    case confirmPassword
}
