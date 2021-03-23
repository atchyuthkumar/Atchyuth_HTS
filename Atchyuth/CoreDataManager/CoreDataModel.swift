//
//  CoreDataModel.swift
//  Atchyuth
//
//  Created by Smscountry on 17/03/21.
//

import Foundation
import UIKit
import CoreData

class CoreDataModel {
    
    static let sharedInstance: CoreDataModel = {
        let instace = CoreDataModel()
        return instace
    }()
    
    let mainContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    func saveData(image_string: String, price: String, title: String)  {
       
        let entity = NSEntityDescription.entity(forEntityName: "BookStore", in: mainContext)
        let newBook = NSManagedObject(entity: entity!, insertInto: mainContext)
        newBook.setValue(image_string, forKey: "image_name")
        newBook.setValue(price, forKey: "price")
        newBook.setValue(title, forKey: "title")
        
        do {
            try mainContext.save()
        } catch let error {
            print("save error is \(error.localizedDescription)")
        }
    }
    
    func fetchingData() -> [BookStore] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BookStore")
        var data = [BookStore]()
        do  {
            let books = try mainContext.fetch(fetchRequest)
            for  book in books as! [BookStore] {
                data.append(book)
            }
        } catch let errror {
            print("fetching error is \(errror.localizedDescription)")
        }
        return data
    }
    
    
    
    
    
    
    
    
}
