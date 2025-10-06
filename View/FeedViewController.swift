//
//  ViewController.swift
//  Weather App
//
//  Created by Student17 on 04/10/2025.
//

import UIKit

class FeedViewController: UIViewController {
    
    let weatherManager = WeatherManager()
    let weatherViewModel = WeatherViewModel()
    var weatherList: [WeatherModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModel.onAllDataLoaded = {[weak self] in
            if let weatherList = self?.weatherViewModel.weatherList {
                print("feed controller - data: \(weatherList)")
                print("Weather list count: \(weatherList.count)")
            }
           
        }
        
        weatherViewModel.fetchAllWeathersModels()

    }

  

}


