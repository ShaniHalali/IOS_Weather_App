//
//  WeatherManager.swift
//  Weather App
//
//  Created by Student17 on 04/10/2025.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

class WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4bebc9f11722499f862dd955d543e2b0&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchCityWeather(cityName: String) {
        let urlByCity = "\(weatherURL)&q=\(cityName)"
        print("URL by \(cityName) = \(urlByCity)")
        self.performRequest(urlString: urlByCity)
    }
    
    func performRequest (urlString: String) {
        //1. Create URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON (weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherId = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let main = decodedData.main
            let wind = decodedData.wind
            
            print("Decoded Data city name: \(name)")
            //print("Decoded Data Temp : \(temp)")
         
            
            let weather = WeatherModel(cityName: name, temperature: main.temp, tempMin: main.tempMin, tempMax: main.tempMin, windSpeed: wind.speed, humidity: main.humidity, conditionId: weatherId)
            //print(weather)
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
}

