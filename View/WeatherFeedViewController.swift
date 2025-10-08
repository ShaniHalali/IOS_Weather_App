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
    var fillteredWeatherList: [WeatherModel] = []
    var selectedCity: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //fetch the cities weather list
        weatherViewModel.onAllDataLoaded = { [weak self] in
            if let weatherList = self?.weatherViewModel.weatherList {
                print("Feed: \(weatherList)")
                self?.fillteredWeatherList = weatherList
                self?.tableView.delegate = self
                self?.tableView.dataSource = self
                self?.tableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "cell")
                self?.tableView.reloadData()
            }
        }

        weatherViewModel.fetchAllWeathersModels()

    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCity"{
            let destinationVC = segue.destination as? CityWeatherViewController
            destinationVC?.city = selectedCity
        }
    }
    
}


// MARK: - Tabel view
extension WeatherFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fillteredWeatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CityCell
        
        let weatherCell = fillteredWeatherList[indexPath.row]
        cell.cityLabel.text = "\(weatherCell.cityName)"
        cell.tempLabel.text = "\(weatherCell.temperatureString)°C"
        cell.iconImage.image = UIImage(systemName: weatherCell.conditionName)
       
        return cell
    }
    
    
}

extension WeatherFeedViewController: UITableViewDelegate {
    // selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell = \(indexPath.row)")
        selectedCity = fillteredWeatherList[indexPath.row]
        performSegue(withIdentifier: "goToCity", sender: self)
    }
}


