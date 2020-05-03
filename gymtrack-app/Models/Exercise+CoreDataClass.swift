//
//  Exercise+CoreDataClass.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Exercise)
public class Exercise: NSManagedObject {
  @NSManaged public var id: UUID
  @NSManaged public var name: String
  @NSManaged public var note: String
  @NSManaged public var unit: String
  @NSManaged public var categories: NSSet
  @NSManaged public var workoutExercises: NSSet
}

extension Exercise {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
    return NSFetchRequest<Exercise>(entityName: "Exercise")
  }
}

// MARK: Generated accessors for categories
extension Exercise {
  @objc(addCategoriesObject:)
  @NSManaged public func addToCategories(_ value: Category)

  @objc(removeCategoriesObject:)
  @NSManaged public func removeFromCategories(_ value: Category)

  @objc(addCategories:)
  @NSManaged public func addToCategories(_ values: NSSet)

  @objc(removeCategories:)
  @NSManaged public func removeFromCategories(_ values: NSSet)
}

// MARK: Generated accessors for workoutExercises
extension Exercise {
  @objc(addWorkoutExercisesObject:)
  @NSManaged public func addToWorkoutExercises(_ value: WorkoutExercise)

  @objc(removeWorkoutExercisesObject:)
  @NSManaged public func removeFromWorkoutExercises(_ value: WorkoutExercise)

  @objc(addWorkoutExercises:)
  @NSManaged public func addToWorkoutExercises(_ values: NSSet)

  @objc(removeWorkoutExercises:)
  @NSManaged public func removeFromWorkoutExercises(_ values: NSSet)
}
