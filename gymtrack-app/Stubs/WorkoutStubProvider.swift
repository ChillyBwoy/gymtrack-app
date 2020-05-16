//
//  WorkoutStubProvider.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 13.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Foundation

class WorkoutStubProvider: StubProvider {
  typealias Item = Workout
  let manager: DataProvider

  required init(manager: DataProvider) {
    self.manager = manager
  }

  func one() -> Workout {
    let calendar = Calendar.current
    let date = calendar.date(from: DateComponents(year: 2020, month: 2, day: 27, hour: 8, minute: 0))!

    let workout = Workout(context: manager.context, date: date)
    
    let category0 = Category(context: manager.context, name: "Arms", color: .red)
    let category1 = Category(context: manager.context, name: "Legs", color: .blue)
    let category2 = Category(context: manager.context, name: "Back", color: .orange)
    let category3 = Category(context: manager.context, name: "Shoulders", color: .pink)
    let category4 = Category(context: manager.context, name: "Cardio", color: .green)
    
    let exercise0 = Exercise(context: manager.context, name: "Warm Up", unit: .check)
    let exercise1 = Exercise(context: manager.context, name: "Jumping Rope", unit: .time)
    let exercise2 = Exercise(context: manager.context, name: "Back Squats", unit: .weight)
    let exercise3 = Exercise(context: manager.context, name: "Front Squats", unit: .weight)
    let exercise4 = Exercise(context: manager.context, name: "Deadlift", unit: .weight)
    let exercise5 = Exercise(context: manager.context, name: "Running", unit: .distance)
    
    exercise1.addToCategories([category4, category0])
    exercise2.addToCategories(category1)
    exercise3.addToCategories([category1, category3])
    exercise4.addToCategories([category1, category2])
    exercise5.addToCategories(category4)
    
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise0, createdAt: date)

    let _ = Effort(context: manager.context, workout: workout, exercise: exercise1, createdAt: calendar.date(byAdding: .minute, value: 1, to: date)!, value: 5, repeats: 3)

    let _ = Effort(context: manager.context, workout: workout, exercise: exercise2, createdAt: calendar.date(byAdding: .minute, value: 10, to: date)!, value: 20, repeats: 15)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise2, createdAt: calendar.date(byAdding: .minute, value: 12, to: date)!, value: 40, repeats: 15)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise2, createdAt: calendar.date(byAdding: .minute, value: 14, to: date)!, value: 50, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise2, createdAt: calendar.date(byAdding: .minute, value: 16, to: date)!, value: 60, repeats: 10)

    let _ = Effort(context: manager.context, workout: workout, exercise: exercise3, createdAt: calendar.date(byAdding: .minute, value: 20, to: date)!, value: 60, repeats: 14)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise3, createdAt: calendar.date(byAdding: .minute, value: 22, to: date)!, value: 70, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise3, createdAt: calendar.date(byAdding: .minute, value: 24, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise3, createdAt: calendar.date(byAdding: .minute, value: 26, to: date)!, value: 90, repeats: 8)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise3, createdAt: calendar.date(byAdding: .minute, value: 30, to: date)!, value: 95, repeats: 6)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise3, createdAt: calendar.date(byAdding: .minute, value: 34, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise3, createdAt: calendar.date(byAdding: .minute, value: 40, to: date)!, value: 70, repeats: 10)

    let _ = Effort(context: manager.context, workout: workout, exercise: exercise4, createdAt: calendar.date(byAdding: .minute, value: 45, to: date)!, value: 20, repeats: 15)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise4, createdAt: calendar.date(byAdding: .minute, value: 48, to: date)!, value: 40, repeats: 15)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise4, createdAt: calendar.date(byAdding: .minute, value: 50, to: date)!, value: 60, repeats: 12)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise4, createdAt: calendar.date(byAdding: .minute, value: 54, to: date)!, value: 80, repeats: 10)
    let _ = Effort(context: manager.context, workout: workout, exercise: exercise4, createdAt: calendar.date(byAdding: .minute, value: 58, to: date)!, value: 90, repeats: 8)

    let _ = Effort(context: manager.context, workout: workout, exercise: exercise5, createdAt: calendar.date(byAdding: .minute, value: 60, to: date)!, value: 5)
    
    return workout
  }
}
