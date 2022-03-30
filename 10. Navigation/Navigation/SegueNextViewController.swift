//
//  SegueNextViewController.swift
//  Navigation
//
//  Created by Phillip Baker on 5/10/21.
//

import UIKit

class SegueNextViewController: UIViewController {

    var labelText: String?
    
    @IBOutlet private(set) var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }
    
    deinit {
        print(">> SegueNextViewController.deinit")
    }
}
