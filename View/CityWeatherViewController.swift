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
    let cityWeatherViewModel = CityWeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cityWeather = city {
            print("selected city in city controller = \(cityWeather)")
            self.displayCityWeatherDetails(cityWeather: cityWeather)
        }

    }
    
    func displayCityWeatherDetails(cityWeather: WeatherModel){
        nameLabel.text = "\(cityWeather.cityName)"
        tempLabel.text = "\(cityWeather.temperatureString)"
        iconImage.image = UIImage(systemName: cityWeather.conditionName)
        minMaxTempLabel.text = "Max/ Min Temp:  \(cityWeather.tempMaxString)°C/\(cityWeather.tempMinString)°C"
        windLabel.text = "Wind:  \(cityWeather.windSpeed) mph"
        humidityLabel.text = "Humidity:  \(cityWeather.humidity)%"
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        if let cityName = city?.cityName {
            cityWeatherViewModel.fetchCityWeather(cityName: cityName )
            cityWeatherViewModel.onCityDataLoaded = {[weak self] cityWeather in
                self?.displayCityWeatherDetails(cityWeather: cityWeather)
                print("refresh city weather data = \(cityWeather)")
            }

        }
        
    }
    
    

}
