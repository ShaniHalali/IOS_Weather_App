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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let weatherViewModel = WeatherViewModel()
    var weatherList: [WeatherModel] = []
    var fillteredWeatherList: [WeatherModel] = []
    var selectedCity: WeatherModel?
    
    var isLoading = true
    let alertManager = AlertManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        toggleLoadingState(isLoading: isLoading)
        
        //No Internet connection listener
        
        weatherViewModel.noInternetConnection = { [weak self] in
            print("Alert no internet connection in WeatherFeedController")
            DispatchQueue.main.async {
                self?.spinner.isHidden = true
                self?.alertManager.showNoInternetAlert(viewController: self!)
            }
            
        }
        weatherViewModel.startMonitoring()
    
        
        //fetch the cities weather list
        weatherViewModel.onAllDataLoaded = { [weak self] in
            if let weatherList = self?.weatherViewModel.weatherList {
                print("Feed: \(weatherList)")
                self?.fillteredWeatherList = weatherList
                
                // data loaded
                self?.isLoading = false
                self?.toggleLoadingState(isLoading: self!.isLoading)
                
                self?.tableView.delegate = self
                self?.tableView.dataSource = self
                self?.tableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "cell")
                self?.tableView.reloadData()
            }
        }
        
     
        
    }
    
    func toggleLoadingState(isLoading: Bool) {
        titleLabel.isHidden = isLoading
        searchBar.isHidden = isLoading
        tableView.isHidden = isLoading
        
        if isLoading {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
            spinner.isHidden = true
        }
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


