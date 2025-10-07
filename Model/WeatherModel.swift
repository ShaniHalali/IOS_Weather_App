//
//  WeatherModel.swift
//  Weather App
//
//  Created by Student17 on 04/10/2025.
//

import Foundation

struct WeatherModel {
    
    let cityName: String
    let  temperature ,tempMin, tempMax, windSpeed: Double
    let humidity, conditionId: Int
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    
    var tempMinString: String {
        return String(format: "%.1f", tempMin)
    }
    
    
    var tempMaxString: String {
        return String(format: "%.1f", tempMax)
    }
    
}
