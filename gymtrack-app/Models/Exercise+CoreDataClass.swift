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
  @NSManaged public var categories: NSSet
  @NSManaged public var workoutExercises: NSSet

  var unit: ExerciseUnit {
    set { setRawValue(forKey: "unit", value: newValue) }
    get { rawValue(forKey: "unit")! }
  }
}

extension Exercise {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
    return NSFetchRequest<Exercise>(entityName: "Exercise")
  }
  
  @nonobjc class func fetchAll() -> NSFetchRequest<Exercise> {
    let request: NSFetchRequest<Exercise> = Exercise.fetchRequest()
    request.sortDescriptors = [
      NSSortDescriptor(key: "name", ascending: true),
    ]
    return request
  }
  
  static func create(with context: NSManagedObjectContext, name: String, unit: ExerciseUnit) -> Exercise {
    let entity = Exercise(context: context)

    entity.id = UUID()
    entity.name = name
    entity.note = ""
    entity.unit = unit
    entity.categories = []
    entity.workoutExercises = []
 
    return entity
  }
}

extension Exercise {
  func groupEffortsByDate() -> [Date: [Effort]] {
    let calendar = Calendar.current
  
    let groups = workoutExercises.reduce(into: [:], {(acc: inout [Date: [Effort]], item) in
      if let workoutExercise = item as? WorkoutExercise {
        for effortItem in workoutExercise.efforts {
          if let effort = effortItem as? Effort {
            let components = calendar.dateComponents([.year, .month, .day], from: effort.createdAt)
            let key = calendar.date(from: components)!
            var currList = acc[key] ?? []
            currList.append(effort)
            acc.updateValue(currList, forKey: key)
          }
        }
      }
    })
    
    return groups
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
