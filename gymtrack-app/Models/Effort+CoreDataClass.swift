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
  @NSManaged public var id: UUID
  @NSManaged public var workout: Workout
  @NSManaged public var exercise: Exercise
  @NSManaged public var createdAt: Date
  @NSManaged public var failure: Bool
  @NSManaged public var repeats: Int16
  @NSManaged public var value: Double

  
  convenience init(context: NSManagedObjectContext, workout: Workout, exercise: Exercise, createdAt: Date, value: Double, repeats: Int16, failure: Bool) {
    self.init(context: context)
    
    self.id = UUID()
    self.workout = workout
    self.exercise = exercise
    self.value = value
    self.repeats = repeats
    self.failure = failure
    self.createdAt = createdAt
  }
  
  convenience init(context: NSManagedObjectContext, workout: Workout, exercise: Exercise, createdAt: Date, value: Double, repeats: Int16) {
    self.init(context: context, workout: workout, exercise: exercise, createdAt: createdAt, value: value, repeats: repeats, failure: false)
  }
  
  convenience init(context: NSManagedObjectContext, workout: Workout, exercise: Exercise, createdAt: Date, value: Double) {
    self.init(context: context, workout: workout, exercise: exercise, createdAt: createdAt, value: value, repeats: 1, failure: false)
  }
  
  convenience init(context: NSManagedObjectContext, workout: Workout, exercise: Exercise, createdAt: Date) {
    self.init(context: context, workout: workout, exercise: exercise, createdAt: createdAt, value: 1, repeats: 1, failure: false)
  }
  
  convenience init(context: NSManagedObjectContext, workout: Workout, exercise: Exercise) {
    self.init(context: context, workout: workout, exercise: exercise, createdAt: Date(), value: 1, repeats: 1, failure: false)
  }
}

extension Effort {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Effort> {
    let request = NSFetchRequest<Effort>(entityName: "Effort")
    request.sortDescriptors = [
      NSSortDescriptor(key: "createdAT", ascending: true),
    ]
    return request
  }
}
