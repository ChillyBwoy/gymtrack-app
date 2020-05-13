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

@objc(Category)
public class Category: NSManagedObject, Identifiable {
  @NSManaged public var id: UUID
  @NSManaged public var name: String
  @NSManaged public var exercises: Set<Exercise>
  
  var color: CategoryColor {
    set { setRawValue(forKey: "color", value: newValue) }
    get { rawValue(forKey: "color")! }
  }
  
  convenience init(context: NSManagedObjectContext, name: String, color: CategoryColor) {
    self.init(context: context)
    self.id = UUID()
    self.name = name
    self.color = color
  }
}

extension Category {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
    return NSFetchRequest<Category>(entityName: "Category")
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
