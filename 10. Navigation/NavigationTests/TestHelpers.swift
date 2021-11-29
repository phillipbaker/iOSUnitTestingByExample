//
//  TestHelpers.swift
//  NavigationTests
//
//  Created by Phillip Baker on 5/10/21.
//

import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}
