//
//  WorkoutExercise+CoreDataClass.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(WorkoutExercise)
public class WorkoutExercise: NSManagedObject {
  @NSManaged public var id: UUID
  @NSManaged public var efforts: Set<Effort>
  @NSManaged public var exercise: Exercise
  @NSManaged public var workout: Workout
}

extension WorkoutExercise {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutExercise> {
    return NSFetchRequest<WorkoutExercise>(entityName: "WorkoutExercise")
  }
  
  static func create(with context: NSManagedObjectContext, workout: Workout, exercise: Exercise) -> WorkoutExercise {
    let entity = WorkoutExercise(context: context)

    entity.id = UUID()
    entity.efforts = []
    entity.workout = workout
    entity.exercise = exercise

    return entity
  }
}

// MARK: Generated accessors for efforts
extension WorkoutExercise {
  @objc(insertObject:inEffortsAtIndex:)
  @NSManaged public func insertIntoEfforts(_ value: Effort, at idx: Int)

  @objc(removeObjectFromEffortsAtIndex:)
  @NSManaged public func removeFromEfforts(at idx: Int)

  @objc(insertEfforts:atIndexes:)
  @NSManaged public func insertIntoEfforts(_ values: [Effort], at indexes: NSIndexSet)

  @objc(removeEffortsAtIndexes:)
  @NSManaged public func removeFromEfforts(at indexes: NSIndexSet)

  @objc(replaceObjectInEffortsAtIndex:withObject:)
  @NSManaged public func replaceEfforts(at idx: Int, with value: Effort)

  @objc(replaceEffortsAtIndexes:withEfforts:)
  @NSManaged public func replaceEfforts(at indexes: NSIndexSet, with values: [Effort])

  @objc(addEffortsObject:)
  @NSManaged public func addToEfforts(_ value: Effort)

  @objc(removeEffortsObject:)
  @NSManaged public func removeFromEfforts(_ value: Effort)

  @objc(addEfforts:)
  @NSManaged public func addToEfforts(_ values: NSOrderedSet)

  @objc(removeEfforts:)
  @NSManaged public func removeFromEfforts(_ values: NSOrderedSet)
}
