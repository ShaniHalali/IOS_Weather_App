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
    // for icon weather image
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}
