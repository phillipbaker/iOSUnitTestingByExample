//
//  ChangePasswordViewController.swift
//  Refactoring
//
//  Created by Phillip Baker on 5/15/21.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet private(set) var cancelBarButton: UIBarButtonItem!
    @IBOutlet private(set) var oldPasswordTextField: UITextField!
    @IBOutlet private(set) var newPasswordTextField: UITextField!
    @IBOutlet private(set) var confirmPasswordTextField: UITextField!
    @IBOutlet private(set) var submitButton: UIButton!
    @IBOutlet private(set) var navigationBar: UINavigationBar!
    
    var securityToken = ""
    lazy var passwordChanger: PasswordChanging = PasswordChanger()
    
    private lazy var presenter = ChangePasswordPresenter(view: self, labels: labels, securityToken: securityToken, passwordChanger: passwordChanger)
    
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    var labels: ChangePasswordLabels!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor(red: 55/255.0, green: 147/255.0, blue: 251/255.0, alpha: 1).cgColor
        submitButton.layer.cornerRadius = 8
        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        setLabels()
    }
    
    @IBAction private func cancel() {
        presenter.cancel()
    }
    
    @IBAction private func changePassword() {
        let passwordInputs = PasswordInputs(
                oldPassword: oldPasswordTextField.text ?? "",
                newPassword: newPasswordTextField.text ?? "",
                confirmPassword: confirmPasswordTextField.text ?? "")
        presenter.changePassword(passwordInputs: passwordInputs)
    }
    
    private func handleFailure(_ message: String) {
        hideActivityIndicator()
        showAlert(message: message) { [weak self] in
            self?.dismissModal()
        }
    }
    
    private func handleSuccess() {
        hideActivityIndicator()
        showAlert(message: labels.successMessage) { [weak self] in
            self?.dismissModal()
        }
    }
    
    private func setLabels() {
        navigationBar.topItem?.title = labels.title
        oldPasswordTextField.placeholder = labels.oldPasswordPlaceholder
        newPasswordTextField.placeholder = labels.newPasswordPlaceholder
        confirmPasswordTextField.placeholder = labels.confirmPasswordPlaceholder
        submitButton.setTitle(labels.submitButtonLabel, for: .normal)
    }
}

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === oldPasswordTextField {
            updateInputFocus(.newPassword)
        } else if textField === newPasswordTextField {
            updateInputFocus(.confirmPassword)
        } else if textField === confirmPasswordTextField {
            changePassword()
        }
        return true
    }
}

extension ChangePasswordViewController: ChangePasswordViewCommands {
    func setCancelButtonEnabled(_ enabled: Bool) {
        self.cancelBarButton.isEnabled = enabled
    }
    
    func clearAllPasswordFields() {
        oldPasswordTextField.text = ""
        newPasswordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
    
    func showBlurView() {
        view.backgroundColor = .clear
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func hideBlurView() {
        blurView.removeFromSuperview()
        view.backgroundColor = .white
    }
    
    func showActivityIndicator() {
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    func dismissModal() {
        self.dismiss(animated: true)
    }
    
    private func showAlert(message: String, okAction: @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: labels.okButtonLabel, style: .default, handler: okAction)
        
        alertController.addAction(okButton)
        alertController.preferredAction = okButton
        self.present(alertController, animated: true)
    }
    
    func showAlert(message: String, action: @escaping () -> Void) {
        let wrappedAction: (UIAlertAction) -> Void = { _ in action() }
        showAlert(message: message) { wrappedAction($0) }
    }
    
    func updateInputFocus(_ inputFocus: InputFocus) {
        switch inputFocus {
        case .noKeyboard:
            view.endEditing(true)
        case .oldPassword:
            oldPasswordTextField.becomeFirstResponder()
        case .newPassword:
            newPasswordTextField.becomeFirstResponder()
        case .confirmPassword:
            confirmPasswordTextField.becomeFirstResponder()
        }
    }
    
    func clearNewPasswordFields() {
        newPasswordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
}
