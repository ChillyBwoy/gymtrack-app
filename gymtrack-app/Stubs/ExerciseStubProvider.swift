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
  private let calendar = Calendar.current

  required init(manager: DataProvider) {
    self.manager = manager
  }
  
  private func effortsFor(exercise: Exercise, date: Date) -> [Effort] {
    var efforts: [Effort] = []
    var currDate = date
    
    for _ in 0..<10 {
      switch (exercise.unit) {
      case .check:
        efforts.append(
          Effort(
            context: manager.context,
            workout: Workout(context: manager.context, date: currDate),
            exercise: exercise,
            createdAt: currDate))
        currDate = calendar.date(byAdding: .day, value: 2, to: currDate)!
        break

      case .distance:
        efforts.append(
          Effort(
            context: manager.context,
            workout: Workout(context: manager.context, date: currDate),
            exercise: exercise,
            createdAt: currDate,
            value: Double.random(in: 2..<10)))
        currDate = calendar.date(byAdding: .day, value: 2, to: currDate)!
        break
        
      case .weight:
        let workout = Workout(context: manager.context, date: currDate)
        for _ in 0..<5 {
          let effort = Effort(
            context: manager.context,
            workout: workout,
            exercise: exercise,
            createdAt: currDate,
            value: Double.random(in: 40..<80),
            repeats: Int16.random(in: 8..<15))

          efforts.append(effort)
          currDate = calendar.date(byAdding: .minute, value: 3, to: currDate)!
        }

        currDate = calendar.date(byAdding: .day, value: 2, to: currDate)!
        break

      default:
        break
      }
    }
    
    return efforts
  }
  
  func list() -> [Exercise] {
    let date = calendar.date(from: DateComponents(year: 2020, month: 2, day: 27, hour: 8, minute: 0))!
    
    let category1 = Category(context: manager.context, name: "Arms", color: .red)
    let category2 = Category(context: manager.context, name: "Back", color: .indigo)
    let category3 = Category(context: manager.context, name: "Legs", color: .blue)
    let category4 = Category(context: manager.context, name: "Cardio", color: .green)

    let exercise1 = Exercise(context: manager.context, name: "Running", unit: .distance)
    exercise1.addToCategories([category4])
    let _ = effortsFor(exercise: exercise1, date: date)
    
    let exercise2 = Exercise(context: manager.context, name: "Back Squats", unit: .weight)
    exercise1.addToCategories([category2, category3])
    let _ = effortsFor(exercise: exercise2, date: date)
    
    let exercise3 = Exercise(context: manager.context, name: "Front Squats", unit: .weight)
    exercise1.addToCategories([category2, category3])
    let _ = effortsFor(exercise: exercise3, date: date)
    
    let exercise4 = Exercise(context: manager.context, name: "Warm Up", unit: .check)
    let _ = effortsFor(exercise: exercise4, date: date)
    
    let exercise5 = Exercise(context: manager.context, name: "Bench Press", unit: .weight)
    exercise5.addToCategories([category1])
    let _ = effortsFor(exercise: exercise5, date: date)

    return [
      exercise1,
      exercise2,
      exercise3,
      exercise4,
      exercise5,
    ]
  }

  func one() -> Exercise {
    let entity = Exercise(context: manager.context, name: "Back Squats", unit: .weight)
    entity.addToCategories([
      Category(context: manager.context, name: "Arms", color: .red),
      Category(context: manager.context, name: "Spin", color: .indigo),
      Category(context: manager.context, name: "Legs", color: .blue)
    ])
  
    var date = calendar.date(from: DateComponents(year: 2020, month: 2, day: 27, hour: 8, minute: 0))!
    var workout = Workout(context: manager.context, date: date)

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 1, to: date)!, value: 20, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 4, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 6, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 8, to: date)!, value: 70, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 10, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 12, to: date)!, value: 90, repeats: 8)

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 3, to: date)!
    workout = Workout(context: manager.context, date: date)

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 12, to: date)!, value: 40, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 14, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 16, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 18, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 20, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 22, to: date)!, value: 90, repeats: 8)

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 5, to: date)!
    workout = Workout(context: manager.context, date: date)

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 24, to: date)!, value: 40, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 26, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 28, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 30, to: date)!, value: 70, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 32, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 34, to: date)!, value: 90, repeats: 8, failure: true)

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 2, to: date)!
    workout = Workout(context: manager.context, date: date)

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 36, to: date)!, value: 40, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 38, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 40, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 42, to: date)!, value: 70, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 44, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 46, to: date)!, value: 90, repeats: 8)

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 5, to: date)!
    workout = Workout(context: manager.context, date: date)

    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 48, to: date)!, value: 40, repeats: 20)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 50, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 52, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 54, to: date)!, value: 70, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 56, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: entity, createdAt: calendar.date(byAdding: .minute, value: 58, to: date)!, value: 90, repeats: 8)

    return entity
  }
}
