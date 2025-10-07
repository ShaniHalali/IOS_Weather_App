//
//  WeatherFeedViewController.swift
//  Weather App
//
//  Created by Student17 on 07/10/2025.
//

import UIKit

class WeatherFeedViewController: UIViewController {
    
    let weatherViewModel = WeatherViewModel()
    var weatherList: [WeatherModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        weatherViewModel.onAllDataLoaded = { [weak self] in
            if let weatherList = self?.weatherViewModel.weatherList {
                print("Feed: \(weatherList)")
            }
        }

        weatherViewModel.fetchAllWeathersModels()

    }
    

 

}
