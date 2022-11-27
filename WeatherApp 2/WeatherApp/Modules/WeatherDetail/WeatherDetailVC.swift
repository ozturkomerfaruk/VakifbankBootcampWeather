//
//  WeatherDetailVC.swift
//  WeatherApp
//
//  Created by Ufuk on 27.11.2022.
//

import UIKit

class WeatherDetailVC: UIViewController {

    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var windDegreeLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var latLabel: UILabel!
    @IBOutlet private weak var lonLabel: UILabel!
    @IBOutlet private weak var localTimeLabel: UILabel!
    var weatherModel: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let weatherModel = weatherModel
        else { return }
        if weatherModel.current.weatherDescriptions.first == "Clear" {
            weatherImageView.image = UIImage(systemName: "sun.max")
        } else if weatherModel.current.weatherDescriptions.first == "Sunny" {
            weatherImageView.image = UIImage(systemName: "sun.max")
        } else if weatherModel.current.weatherDescriptions.first == "Cloudy" {
            weatherImageView.image = UIImage(systemName: "cloud")
        }
        temperatureLabel.text = String(weatherModel.current.temperature)
        windSpeedLabel.text = String(weatherModel.current.windSpeed)
        windDegreeLabel.text = String(weatherModel.current.windDegree)
        humidityLabel.text = String(weatherModel.current.humidity)
        locationNameLabel.text = weatherModel.location.name
        latLabel.text = weatherModel.location.lat
        lonLabel.text = weatherModel.location.lon
        localTimeLabel.text = weatherModel.location.localtime
    }
    
    func config(with model: WeatherModel) {

        

    }
}
