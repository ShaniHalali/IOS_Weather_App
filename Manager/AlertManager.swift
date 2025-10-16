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
    
    func showNoSavedDataAlert(viewController: UIViewController) {
        let alert = UIAlertController(title: "No Saved Data", message: "", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        viewController.present(alert,animated: true)
    }
    
    func showNoCityFoundAlert(viewController: UIViewController) {
        let alert = UIAlertController(title: "City Not Found", message: "Please try another one", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        viewController.present(alert,animated: true)
    }
    
    func showEmptyTextAlert(viewController: UIViewController) {
        let alert = UIAlertController(title: "Please enter a city name", message: "", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        viewController.present(alert,animated: true)
    }
    
    
}
