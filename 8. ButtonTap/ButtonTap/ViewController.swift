//
//  ViewController.swift
//  ButtonTap
//
//  Created by Phillip Baker on 5/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func buttonTap() {
        print(">> Button was tapped.")
    }


}

