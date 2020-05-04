//
//  Workout+CoreDataClass.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Workout)
public class Workout: NSManagedObject {
  @NSManaged public var date: Date
  @NSManaged public var id: UUID
  @NSManaged public var note: String
  @NSManaged public var workoutExercises: NSSet
}

extension Workout {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
    return NSFetchRequest<Workout>(entityName: "Workout")
  }
  
  static func create(with context: NSManagedObjectContext, date: Date) -> Workout {
    let entity = Workout(context: context)

    entity.id = UUID()
    entity.date = date
    entity.workoutExercises = []
    entity.note = ""

    return entity
  }
}

// MARK: Generated accessors for workoutExercises
extension Workout {
  @objc(addWorkoutExercisesObject:)
  @NSManaged public func addToWorkoutExercises(_ value: WorkoutExercise)

  @objc(removeWorkoutExercisesObject:)
  @NSManaged public func removeFromWorkoutExercises(_ value: WorkoutExercise)

  @objc(addWorkoutExercises:)
  @NSManaged public func addToWorkoutExercises(_ values: NSSet)

  @objc(removeWorkoutExercises:)
  @NSManaged public func removeFromWorkoutExercises(_ values: NSSet)
}
