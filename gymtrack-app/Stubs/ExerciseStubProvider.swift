//
//  ExerciseStubProvider.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 04.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Foundation

class ExerciseStubProvider: StubProvider {
  typealias Item = Exercise
  
  let manager: DataProvider

  required init(manager: DataProvider) {
    self.manager = manager
  }
  
  private func create(name: String, unit: ExerciseUnit) -> Exercise {
    let entity = Exercise(context: manager.context, name: name, unit: unit)
    return entity
  }

  func one() -> Exercise {
    let entity = Exercise(context: manager.context, name: "Back Squats", unit: .weight)
    entity.addToCategories([
      Category(context: manager.context, name: "Arms", color: .red),
      Category(context: manager.context, name: "Spin", color: .indigo),
      Category(context: manager.context, name: "Legs", color: .blue)
    ])
  
    let calendar = Calendar.current
    var date = calendar.date(from: DateComponents(year: 2020, month: 2, day: 27, hour: 8, minute: 0))!
    let workout = Workout(context: manager.context, date: date)

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 1, to: date)!, value: 20, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 4, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 6, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 8, to: date)!, value: 70, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 10, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 12, to: date)!, value: 90, repeats: 8)

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 3, to: date)!

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 12, to: date)!, value: 40, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 14, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 16, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 18, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 20, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 22, to: date)!, value: 90, repeats: 8)

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 5, to: date)!

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 24, to: date)!, value: 40, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 26, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 28, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 30, to: date)!, value: 70, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 32, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 34, to: date)!, value: 90, repeats: 8, failure: true)

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 2, to: date)!

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 36, to: date)!, value: 40, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 38, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 40, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 42, to: date)!, value: 70, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 44, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 46, to: date)!, value: 90, repeats: 8)

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 5, to: date)!

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 48, to: date)!, value: 40, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 50, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 52, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 54, to: date)!, value: 70, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 56, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 58, to: date)!, value: 90, repeats: 8)

    return entity
  }
}
