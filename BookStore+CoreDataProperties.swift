//
//  BookStore+CoreDataProperties.swift
//  Atchyuth
//
//  Created by Smscountry on 17/03/21.
//
//

import Foundation
import CoreData


extension BookStore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookStore> {
        return NSFetchRequest<BookStore>(entityName: "BookStore")
    }

    @NSManaged public var image_name: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?

}

extension BookStore : Identifiable {

}
