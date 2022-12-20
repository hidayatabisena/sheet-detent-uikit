//
//  MapViewController.swift
//  SheetDetent
//
//  Created by Hidayat Abisena on 20/12/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configureMap() {
        view.addSubview(mapView)
        mapView.overrideUserInterfaceStyle = .dark
        mapView.frame = view.bounds
    }
    
    private func configureSheet() {
        let vc = HomePageViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        nav.isModalInPresentation = true
        if let sheet = sheetPresentationController {
            sheet.preferredCornerRadius = 24
            sheet.detents = [.custom(resolver: { context in
                0.1 * context.maximumDetentValue
            }), .large()]
        }
        
        navigationController?.present(nav, animated: true)
    }

}
