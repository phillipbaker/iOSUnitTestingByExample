//
//  ViewController.swift
//  Alert
//
//  Created by Phillip Baker on 5/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func buttonTap() {
        let alert = UIAlertController(title: "Do the thing?", message: "Let us know if you want to do the thing.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print(">> Cancel")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print(">> OK")
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.preferredAction = okAction
        present(alert, animated: true)
        
        
    }


}

