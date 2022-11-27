//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by Ömer Faruk Öztürk on 27.11.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private let managedContext: NSManagedObjectContext!
    
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func saveNote(city: String) -> DenemeModel? {
        let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: managedContext)!
        let favorite = NSManagedObject(entity: entity, insertInto: managedContext)
        favorite.setValue(city, forKeyPath: "cityText")

        do {
            try managedContext.save()
            return favorite as? DenemeModel
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return nil
    }
    
    func getNotes() -> [DenemeModel] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
        do {
            let cities = try managedContext.fetch(fetchRequest)
            return cities as! [DenemeModel]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
}

struct DenemeModel {
    var deneme: String
}
