//
//  Category+CoreDataClass.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//
//

import UIKit
import CoreData
import SwiftUI

@objc(Category)
public class Category: NSManagedObject {
  @NSManaged public var id: UUID
  @NSManaged public var name: String
  var color: CategoryColor {
    set { setRawValue(forKey: "color", value: newValue) }
    get { rawValue(forKey: "color")! }
  }
  @NSManaged public var exercises: NSSet
}

extension Category {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
    return NSFetchRequest<Category>(entityName: "Category")
  }
  
  static func create(with context: NSManagedObjectContext, name: String, color: CategoryColor) -> Category {
    let entity = Category(context: context)
    entity.id = UUID()
    entity.name = name
    entity.color = color

    return entity
  }
}

// MARK: Generated accessors for exercises
extension Category {
  @objc(addExercisesObject:)
  @NSManaged public func addToExercises(_ value: Exercise)

  @objc(removeExercisesObject:)
  @NSManaged public func removeFromExercises(_ value: Exercise)

  @objc(addExercises:)
  @NSManaged public func addToExercises(_ values: NSSet)

  @objc(removeExercises:)
  @NSManaged public func removeFromExercises(_ values: NSSet)
}
