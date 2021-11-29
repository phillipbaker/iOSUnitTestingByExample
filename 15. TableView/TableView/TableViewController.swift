//
//  TableViewController.swift
//  TableView
//
//  Created by Phillip Baker on 5/14/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let model = [
        "One",
        "Two",
        "Three"
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model[indexPath.row])
    }
}
