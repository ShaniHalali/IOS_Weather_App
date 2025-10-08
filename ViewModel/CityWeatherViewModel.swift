//
//  CityWeatherViewModel.swift
//  Weather App
//
//  Created by Student17 on 08/10/2025.
//

import Foundation

class CityWeatherViewModel: WeatherManagerDelegate {
    
    private let weatherManager = WeatherManager()
    var onCityDataLoaded: ( (WeatherModel) -> Void )?
    
    init() {
        weatherManager.delegate = self
    }
    
    func fetchCityWeather(cityName: String) {
        weatherManager.fetchCityWeather(cityName: cityName)
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        // only when weather model is done to fetch - we will get the update city weather model
        DispatchQueue.main.async { [weak self] in
            self?.onCityDataLoaded?(weather)
        }
    }
    
    
}
