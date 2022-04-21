//
//  ChangePasswordPresenter.swift
//  Refactoring
//
//  Created by Phillip Baker on 5/21/21.
//

import Foundation

class ChangePasswordPresenter {
    private unowned var view: ChangePasswordViewCommands!
    private let viewModel: ChangePasswordViewModel
    private var securityToken: String
    private var passwordChanger: PasswordChanging
    
    init(view: ChangePasswordViewCommands, viewModel: ChangePasswordViewModel, securityToken: String, passwordChanger: PasswordChanging) {
        self.view = view
        self.viewModel = viewModel
        self.securityToken = securityToken
        self.passwordChanger = passwordChanger
    }
    
    private func startOver() {
        view.clearAllPasswordFields()
        view.updateInputFocus(.oldPassword)
        view.hideBlurView()
        view.setCancelButtonEnabled(true)
    }
    
    private func resetNewPasswords() {
        view.clearNewPasswordFields()
        view.updateInputFocus(.newPassword)
    }
    
    private func setUpWaitingAppearance() {
        view.updateInputFocus(.noKeyboard)
        view.setCancelButtonEnabled(false)
        view.showBlurView()
        view.showActivityIndicator()
    }
    
    private func attemptToChangePassword(passwordInputs: PasswordInputs) {
        passwordChanger.change(
            securityToken: securityToken,
            oldPassword: passwordInputs.oldPassword,
            newPassword: passwordInputs.newPassword,
            onSuccess: { [weak self] in
                self?.handleSuccess()
            },
            onFailure: { [weak self] message in
                self?.handleFailure(message)
            }
        )
    }
    
    private func handleSuccess() {
        view.hideActivityIndicator()
        view.showAlert(message: viewModel.successMessage) { [weak self] in
            self?.view.dismissModal()
        }
    }
    
    private func handleFailure(_ message: String) {
        view.hideActivityIndicator()
        view.showAlert(message: message) { [weak self] in
            self?.startOver()
        }
    }
    
    func changePassword(passwordInputs: PasswordInputs) {
        guard validateInputs(passwordInputs: passwordInputs) else { return }
        setUpWaitingAppearance()
        attemptToChangePassword(passwordInputs: passwordInputs)
    }
    
    func cancel() {
        view.updateInputFocus(.noKeyboard)
        view.dismissModal()
    }
    
    private func validateInputs(passwordInputs: PasswordInputs) -> Bool {
        if passwordInputs.isOldPasswordEmpty {
            view.updateInputFocus(.oldPassword)
            return false
        }
        
        if passwordInputs.isNewPasswordEmpty {
            view.showAlert(message: viewModel.enterNewPasswordMessage) { [weak self] in
                self?.view.updateInputFocus(.newPassword)
            }
            return false
        }
        
        if passwordInputs.isNewPasswordTooShort {
            view.showAlert(message: viewModel.newPasswordTooShortMessage) { [weak self] in
                self?.resetNewPasswords()
            }
            return false
        }
        
        if passwordInputs.isConfirmPasswordMismatched {
            view.showAlert(message: viewModel.confirmationDoesNotMatchMessage) { [weak self] in
                self?.resetNewPasswords()
            }
            return false
        }
        return true
    }
}
