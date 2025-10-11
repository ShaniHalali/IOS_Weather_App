//
//  AlertManager.swift
//  Weather App
//
//  Created by Student17 on 10/10/2025.
//

import Foundation
import UIKit

class AlertManager {
    
    func showNoInternetAlert(viewController: UIViewController) {
        let alert = UIAlertController(title: "No Internet Connection", message: "Showing last saved data ", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        viewController.present(alert,animated: true)
    }
    
    
}
