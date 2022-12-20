//
//  ViewController.swift
//  SheetDetent
//
//  Created by Hidayat Abisena on 20/12/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - PROPERTIES
    let itemsTVC = ItemsTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setupUI()
    }
    
    private func setupUI() {
        // MARK: - CREATE STACKVIEW
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - CREATE BUTTON
        var config = UIButton.Configuration.filled()
        config.title = "Show Sheets"
        
        let button = UIButton(configuration: config, primaryAction: UIAction() { _ in
            self.itemsTVC.delegate = self
            
            // show the sheet
            if let sheet = self.itemsTVC.sheetPresentationController {
                // half sheet detents
                // sheet.detents = [.medium(), .large()]
                
                // custom sheet detents size
                sheet.detents = [
                    .custom { _ in
                        return 200
                    },
                    .custom { context in
                        return context.maximumDetentValue * 0.6
                    }
                ]
                sheet.prefersGrabberVisible = true
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.largestUndimmedDetentIdentifier = .medium
            }
            
            self.present(self.itemsTVC, animated: true, completion: nil)
        })
        
        stackView.addArrangedSubview(button)
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

// MARK: - EXTENSIONS
extension ViewController: ItemsTableViewControllerDelegate {
    func itemsTableViewControllerDidSelect(item: String) {
        
        if let sheet = itemsTVC.sheetPresentationController {
            sheet.animateChanges {
                sheet.selectedDetentIdentifier = .medium
            }
        }
    }
}


