//
//  CodeBasedViewController.swift
//  LoadViewControllers
//
//  Created by Phillip Baker on 5/6/21.
//

import UIKit

class CodeBasedViewController: UIViewController {
    private let data: String
    
    init(data: String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }                         
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(">>...create views here")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
