//
//  TestHelpers.swift
//  ButtonTapTests
//
//  Created by Phillip Baker on 5/9/21.
//

import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func tap(_ button: UIBarButtonItem) {
    _ = button.target?.perform(button.action, with: nil)
}
