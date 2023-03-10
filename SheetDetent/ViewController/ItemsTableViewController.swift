//
//  ItemsTableViewController.swift
//  SheetDetent
//
//  Created by Hidayat Abisena on 20/12/22.
//

import Foundation
import UIKit

protocol ItemsTableViewControllerDelegate {
    func itemsTableViewControllerDidSelect(item: String)
}

class ItemsTableViewController: UITableViewController {
    
    let items = Range(0...20).map { "\($0)" }
    var delegate: ItemsTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ItemCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        if let delegate = delegate {
            delegate.itemsTableViewControllerDidSelect(item: item)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = "Item \(indexPath.row)"
        cell.contentConfiguration = content
        return cell
    }
    
}
