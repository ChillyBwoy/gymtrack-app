//
//  Effort+CoreDataClass.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Effort)
public class Effort: NSManagedObject {
  @NSManaged public var createdAt: Date
  @NSManaged public var failure: Bool
  @NSManaged public var id: UUID
  @NSManaged public var repeats: Int16
  @NSManaged public var value: Double
  @NSManaged public var workoutExercise: WorkoutExercise
}

extension Effort {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Effort> {
    return NSFetchRequest<Effort>(entityName: "Effort")
  }

  static func create(with context: NSManagedObjectContext, workoutExercise: WorkoutExercise, value: Double, repeats: Int16, failure: Bool) -> Effort {
    let entity = Effort(context: context)

    entity.id = UUID()
    entity.createdAt = Date()
    entity.workoutExercise = workoutExercise
    entity.repeats = repeats
    entity.failure = failure
    entity.value = value

    return entity
  }
}
