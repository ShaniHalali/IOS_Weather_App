//
//  CityWeatherViewModel.swift
//  Weather App
//
//  Created by Student17 on 08/10/2025.
//

import Foundation

class CityWeatherViewModel: WeatherManagerDelegate, NetworkMonitorDelegate {
   
    private let weatherManager = WeatherManager()
    var onCityDataLoaded: ( (WeatherModel) -> Void )?
    private let networkingMonitor = NetworkMonitor()
    private var connection = false
    
    private var hasFetch = false
    let coreData = CoreDataManager()
    

    init() {
        weatherManager.delegate = self
        networkingMonitor.delegate = self
        networkingMonitor.startMonitoring()

        
    }
  
    
    func didChangeConnectionStatus(isConnected: Bool) {
        if isConnected {
            print("city weather view model = internet connection works ")
        } else {
            print("city weather view model = No internet connection")
        }
        connection = isConnected
    }
    
    func fetchCityWeather(cityName: String) {
        if connection {
            weatherManager.fetchCityWeather(cityName: cityName)
        } else {
            print("city weather view model = can't fetch city weather")
            //load saved city details
            if let city = coreData.loadCityData(cityName: cityName) {
                onCityDataLoaded?(city)
                print("city saved data = \(city) ")
            } else {
                print("no saved city data for - \(cityName)")
            }
        }
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        // only when weather model is done to fetch - we will get the update city weather model
        DispatchQueue.main.async { [weak self] in
            self?.onCityDataLoaded?(weather)
        }
    }
    
    
}
