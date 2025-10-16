//
//  CoreDataManager.swift
//  Weather App
//
//  Created by student17 on 10/10/2025.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    var weatherDataList: [WeatherModel] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    
    
    func saveWeatherCityData(weather: WeatherModel) {
        let fetchRequest: NSFetchRequest<WeatherEntity> = WeatherEntity.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "cityName == %@", weather.cityName)
           
           do {
               let results = try context.fetch(fetchRequest)
               if let existingEntity = results.first {
                   // Update existing city
                   existingEntity.conditionId = Int16(weather.conditionId)
                   existingEntity.humidity = Int16(weather.humidity)
                   existingEntity.tempMax = weather.tempMax
                   existingEntity.tempMin = weather.tempMin
                   existingEntity.temperature = weather.temperature
                   existingEntity.windSpeed = weather.windSpeed
                   
                   print("updated weather for existing city: \(weather.cityName)")
               } else {
                   // Create new city in core data if not exists
                  createNewWeatherEntity(weather: weather)
                   
                   print("Added new city to core data: \(weather.cityName)")
               }
               
               try context.save()
               print("Saved successfully to Core Data")
               
           } catch {
               print("Error saving or updating weather: \(error)")
           }
        
    }
    
    func createNewWeatherEntity(weather: WeatherModel) {
        let newWeatherData = WeatherEntity(context: context)

        newWeatherData.cityName = weather.cityName
        newWeatherData.conditionId = Int16(weather.conditionId)
        newWeatherData.humidity = Int16(weather.humidity)
        newWeatherData.tempMax = weather.tempMax
        newWeatherData.tempMin = weather.tempMin
        newWeatherData.temperature = weather.temperature
        newWeatherData.windSpeed = weather.windSpeed
    }
    
    private func saveWeather() {
        do {
            try context.save()
            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
            print("saved in core data")
            
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    func deleteAllWeatherDataList() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherEntity")
         let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
         
         do {
             try context.execute(deleteRequest)
             try context.save()
             print("All WeatherEntity records deleted successfully")
         } catch {
             print("Error deleting all WeatherEntity records: \(error)")
         }
    }
    
    func loadWeatherDataList() -> [WeatherModel]? {
        let request: NSFetchRequest<WeatherEntity> = WeatherEntity.fetchRequest()
        do{
            let weatherEntityList = try context.fetch(request)
            
            return convertEntityListToModelList(weatherEntityList: weatherEntityList)
            
        } catch {
            print("Error fetching data from context \(error)")
        }
        return nil
    }
    
    func loadCityData(cityName: String) -> WeatherModel? {
        let request: NSFetchRequest<WeatherEntity> = WeatherEntity.fetchRequest()
        do{
            let weatherEntityList = try context.fetch(request)
            
            let citiesList = convertEntityListToModelList(weatherEntityList: weatherEntityList)
            return citiesList.first(where: {$0.cityName == cityName})

            
        } catch {
            print("Error fetching city data from context \(error)")
        }
        return nil
    }
    
    private func convertEntityListToModelList(weatherEntityList: [WeatherEntity]) -> [WeatherModel] {
        var weatherModelList: [WeatherModel] = []
        
        for weather in weatherEntityList {
            let weatherModel = WeatherModel(cityName: weather.cityName!, temperature: weather.temperature, tempMin: weather.tempMin, tempMax: weather.tempMax, windSpeed: weather.windSpeed, humidity: Int(weather.humidity), conditionId: Int(weather.conditionId))
            weatherModelList.append(weatherModel)
        }
        
        
        return weatherModelList
    }
}
