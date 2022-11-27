//
//  MainVC.swift
//  WeatherApp
//
//  Created by Ufuk on 27.11.2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet private var datePickerView: UIDatePicker!
    @IBOutlet private weak var cityTextField: UITextField!
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private var toolbar: UIToolbar!
    private var weatherData: WeatherModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareDateTextFİeld()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weatherDetail" {
            if let destinationVC = segue.destination as? WeatherDetailVC {
                guard let weatherData = weatherData
                else { return }
//                destinationVC.config(with: weatherData)
                destinationVC.weatherModel = weatherData
            }
        }
    }
    
    func prepareDateTextFİeld() {
        datePickerView.datePickerMode = .date
        datePickerView.preferredDatePickerStyle = .wheels
        dateTextField.inputView = datePickerView
        dateTextField.inputAccessoryView = toolbar
    }
    
    @IBAction func didDateSelect(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "US-us")
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        dateTextField.text = dateFormatter.string(from: datePickerView.date)
    }
    
    @IBAction func didTappedSearchButton(_ sender: Any) {
        Client.getWeatherByCity(city: "Ankara") { [weak self] weather, error in
            guard let self = self
            else { return }
            self.weatherData = weather
            self.performSegue(withIdentifier: "weatherDetail", sender: nil)
        }
    }
}
