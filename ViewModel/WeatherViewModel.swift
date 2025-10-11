//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Student17 on 04/10/2025.
//

import Foundation

class WeatherViewModel: WeatherManagerDelegate, NetworkMonitorDelegate {
   
    
    
    let cities = ["London", "Tel%20Aviv", "New%20York", "Paris", "Rome", "Barcelona"]
    private let weatherManger = WeatherManager()
    private(set) var weatherList: [WeatherModel] = []
    private let group = DispatchGroup()
    var onAllDataLoaded: ( () -> Void )?
    var noInternetConnection: ( () -> Void )?
    
    private let networkMonitor = NetworkMonitor()
    private var hasFetch = false
    
    let coreData = CoreDataManager()

    init() {
        weatherManger.delegate = self
        networkMonitor.delegate = self
    }
    
    func startMonitoring() {
        networkMonitor.startMonitoring()

    }
    
    func didChangeConnectionStatus(isConnected: Bool) {
        if isConnected && !hasFetch {
            print("weather view model = internet connection works ")
            hasFetch = true
            fetchAllWeathersModels()
        } else if !isConnected {
            print("weather view model = No internet connection")
            noInternetConnection?()
            if let weatherDataList = coreData.loadWeatherDataList() {
                weatherList = weatherDataList
                print("List from core data")

            } else {
                print("No saved weather in core data")
            }
        }
    }

    
    func fetchAllWeathersModels() {
       
            for city in cities {
                group.enter()
                weatherManger.fetchCityWeather(cityName: city)
            }
        
            group.notify(queue: .main) { [weak self] in
                self?.onAllDataLoaded?()
            }
        

    }
    
    
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async { [weak self] in
            self?.weatherList.append(weather)
            print("appended to weather data list: \(weather.cityName)")
            self?.group.leave()
            //save the weatherList in core data
            self?.coreData.saveWeatherCityData(weather: weather)
        }
       
      
    }
    
    
}
