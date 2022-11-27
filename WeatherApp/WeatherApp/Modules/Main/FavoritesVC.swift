//
//  FavoritesVC.swift
//  WeatherApp
//
//  Created by Ömer Faruk Öztürk on 27.11.2022.
//

import UIKit

class FavoritesVC: UIViewController {
    
    var notes: [DenemeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deneme(_ sender: UIButton) {
        notes = CoreDataManager.shared.getNotes()
        print(notes)
    }

    @IBAction func yaz(_ sender: UIButton) {
        notes.append(CoreDataManager.shared.saveNote(city: "Ankara")!)
    }
}
