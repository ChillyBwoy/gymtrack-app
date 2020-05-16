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
  @NSManaged public var efforts: Set<Effort>
  
  convenience init(context: NSManagedObjectContext, date: Date, note: String) {
    self.init(context: context)
    self.id = UUID()
    self.date = date
    self.note = note
  }

  convenience init(context: NSManagedObjectContext, date: Date) {
    self.init(context: context, date: date, note: "")
  }
}

extension Workout {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
    return NSFetchRequest<Workout>(entityName: "Workout")
  }
  
  static func create(with context: NSManagedObjectContext, date: Date) -> Workout {
    let entity = Workout(context: context)

    entity.id = UUID()
    entity.date = date
    entity.note = ""

    return entity
  }
}

extension Workout {
  func categories() -> [Category] {
    var seen: [UUID: Bool] = [:]
    
    return efforts.reduce(into: []) { (acc: inout [Category], effort) in
      let categories = effort.exercise.categories.filter { seen.updateValue(true, forKey: $0.id) == nil }
      acc.append(contentsOf: categories)
    }
  }
  
  func effortsByExercises() -> [(Exercise, [Effort])] {
    let groups = Dictionary(grouping: efforts, by: { item in item.exercise})
    
    let sortedExercises: [Exercise] = groups.keys.sorted { (a, b) -> Bool in
      if let effortA = groups[a]?[0], let effortB = groups[b]?[0] {
        return effortA.createdAt.compare(effortB.createdAt) == .orderedAscending
      }
      return false
    }
    
    return sortedExercises.map { exercise in
      (exercise, groups[exercise] ?? [])
    }
  }

  func categoriesByExercies() -> [Category: Double] {
    var total = 0

    let result = efforts.reduce(into: [:]) { (acc: inout [Category: Int], effort) in
      for category in effort.exercise.categories {
        let count = acc[category] ?? 0
        acc.updateValue(count + 1, forKey: category)
        total += 1
      }
    }
    
    return result.reduce(into: [:]) { (acc: inout [Category: Double], item) in
      let (key, value) = item
      acc[key] = Double(value) / Double(total)
    }
  }
}

// MARK: Generated accessors for efforts
extension Workout {
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
