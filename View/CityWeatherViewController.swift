//
//  CityWeatherViewController.swift
//  Weather App
//
//  Created by Student17 on 08/10/2025.
//

import UIKit

class CityWeatherViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var minMaxTempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    var city: WeatherModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cityWeather = city {
            print("selected city in city controller = \(cityWeather)")
        }

    }
    

    

}
