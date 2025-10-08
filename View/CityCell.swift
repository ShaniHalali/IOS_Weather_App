//
//  WeatherCell.swift
//  Weather App
//
//  Created by Student17 on 08/10/2025.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        weatherView.layer.cornerRadius = weatherView.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
