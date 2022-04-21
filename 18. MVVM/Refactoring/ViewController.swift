//
//  ViewController.swift
//  Refactoring
//
//  Created by Phillip Baker on 5/15/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "changePassword" {
            let changePasswordVC = segue.destination as? ChangePasswordViewController
            changePasswordVC?.securityToken = "TOKEN"
            changePasswordVC?.viewModel = ChangePasswordViewModel(
                okButtonLabel: "OK",
                enterNewPasswordMessage: "Please enter a new password.",
                newPasswordTooShortMessage: "The new password should have at least 6 characters.",
                confirmationDoesNotMatchMessage: "The new password and the confirmation password " + "don’t match. Please try again.",
                successMessage: "Success",
                failureMessage: "Sorry, something went wrong.")
        }
    }
}

