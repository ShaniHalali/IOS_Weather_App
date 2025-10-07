//
//  WeatherFeedViewController.swift
//  Weather App
//
//  Created by Student17 on 07/10/2025.
//

import UIKit

class WeatherFeedViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let weatherViewModel = WeatherViewModel()
    var weatherList: [WeatherModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //fetch the cities weather list
        weatherViewModel.onAllDataLoaded = { [weak self] in
            if let weatherList = self?.weatherViewModel.weatherList {
                print("Feed: \(weatherList)")
            }
        }

        weatherViewModel.fetchAllWeathersModels()

    }
    
}


