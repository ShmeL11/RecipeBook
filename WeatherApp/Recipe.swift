//
//  Recipe.swift
//  WeatherApp
//
//  Created by Mac on 18.03.2024.
//

import Foundation
import CoreData

class Recipe: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged public var ingredients: String
    @NSManaged public var instructions: String
    @NSManaged public var imageUrl: String
    @NSManaged public var isFavorite: Bool
}
