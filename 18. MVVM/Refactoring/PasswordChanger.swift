//
//  PasswordChanger.swift
//  Refactoring
//
//  Created by Phillip Baker on 5/15/21.
//

import Foundation

protocol PasswordChanging {
    func change(securityToken: String, oldPassword: String, newPassword: String, onSuccess: @escaping () -> Void, onFailure: @escaping () -> Void)
}

final class PasswordChanger: PasswordChanging {
    private static var pretendToSucceed = false
    private var successOrFailureTimer: SuccessOrFailureTimer?
    
    func change(securityToken: String,
                oldPassword: String,
                newPassword: String,
                onSuccess: @escaping () -> Void,
                onFailure: @escaping () -> Void) {
        print("Initiate Change Password:")
        print("securityToken = \(securityToken)")
        print("oldPassword = \(newPassword)")
        print("newPassword = \(newPassword)")
        
        successOrFailureTimer = SuccessOrFailureTimer(
            onSuccess: onSuccess,
            onFailure: onFailure,
            timer: Timer.scheduledTimer(
                withTimeInterval: 1,
                repeats: false
            ) { [weak self] _ in self?.callSuccessOrFailure() }
        )
    }
    
    private func callSuccessOrFailure() {
        if PasswordChanger.pretendToSucceed {
            successOrFailureTimer?.onSuccess()
        } else {
            successOrFailureTimer?.onFailure()
        }
        PasswordChanger.pretendToSucceed.toggle()
        successOrFailureTimer?.timer.invalidate()
        successOrFailureTimer = nil
    }
}

private struct SuccessOrFailureTimer {
    let onSuccess: () -> Void
    let onFailure: () -> Void
    let timer: Timer
}
