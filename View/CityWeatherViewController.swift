//
//  CityWeatherViewController.swift
//  Weather App
//
//  Created by Student17 on 08/10/2025.
//

import UIKit

class CityWeatherViewController: UIViewController {
    
    var city: WeatherModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cityWeather = city {
            print("selected city in city controller = \(cityWeather)")
        }

    }
    

    

}
