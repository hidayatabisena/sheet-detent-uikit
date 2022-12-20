//
//  HomePageViewController.swift
//  SheetDetent
//
//  Created by Hidayat Abisena on 20/12/22.
//

import UIKit

class HomePageViewController: UIViewController {
    
    // UIKit VSTACK equivalent
    lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    // LABEL
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Programmatically in UIKit 🔥"
        label.font = UIFont(name: "Raleway-Semibold", size: 20)
        label.textColor = UIColor.blue
        
        return label
    }()
    
    // BUTTON
    lazy var cardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.purple
        button.setTitle("Show profile", for: .normal)
        
        return button
    }()
    
    // CardView
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1.0, green: 0.784, blue: 0.2, alpha: 1.0)
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // ZSTACK
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(cardView)
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(cardButton)
        
        contentView.addSubview(contentStack)
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            // constraint contentView to all 4 sides of super view
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150.0),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            
            // constraint contentView Width equal to view's width
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0),
            
            // constraint cardView Width equal to contentView Width
            cardView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0),
            
            // constraint cardView centerX to contentView centerX
            cardView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            //cardView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0),
            cardView.heightAnchor.constraint(equalToConstant: 900.0),
            
            // contentStack constraint
            contentStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 40.0),
            contentStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20.0),
            contentStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            //contentStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            
            cardButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        cardButton.layer.cornerRadius = 30
        cardView.roundCorners(cornerRadius: 20.0)
    }
}

// MARK: - EXTENSIONS
extension UIView {
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
    }
    
}
