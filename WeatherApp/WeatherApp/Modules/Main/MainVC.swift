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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareDateTextFİeld()
        
        Client.getWeatherByCity(city: "Ankara") { weather, error in
            print(weather)
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
}
