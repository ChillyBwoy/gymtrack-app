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
  @NSManaged public var categories: Set<Category>
  @NSManaged public var efforts: Set<Effort>

  var unit: ExerciseUnit {
    set { setRawValue(forKey: "unit", value: newValue) }
    get { rawValue(forKey: "unit")! }
  }
  
  convenience init(context: NSManagedObjectContext, name: String, unit: ExerciseUnit, note: String) {
    self.init(context: context)
    
    self.id = UUID()
    self.name = name
    self.unit = unit
    self.note = note
  }
  
  convenience init(context: NSManagedObjectContext, name: String, unit: ExerciseUnit) {
    self.init(context: context, name: name, unit: unit, note: "")
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
}

extension Exercise {
  func effortsGroupedByDate() -> [Date: [Effort]] {
    let calendar = Calendar.current

    let groups = efforts.reduce(into: [:], { ( acc: inout [Date: [Effort]], effort) in
      let components = calendar.dateComponents([.year, .month, .day], from: effort.createdAt)
      let key = calendar.date(from: components)!
      var currList = acc[key] ?? []
      currList.append(effort)
      acc.updateValue(currList, forKey: key)
    })
    
    return groups
  }
  
  func stat() -> ExerciseStat {
    let sorted = efforts.sorted(by: { $0.value < $1.value })

    let averageValue = sorted.reduce(0, { $0 + $1.value }) / Double(efforts.count)
    let averageRepeats = sorted.reduce(0, { $0 + Int($1.repeats) }) / efforts.count
    let best = efforts.max(by: { $0.value < $1.value })
    let median = sorted[efforts.count / 2]
    
    return ExerciseStat(
      average: (averageValue, averageRepeats),
      best: (best?.value ?? 0, Int(best?.repeats ?? 0)),
      median: (median.value, Int(median.repeats)))
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

// MARK: Generated accessors for efforts
extension Exercise {
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
