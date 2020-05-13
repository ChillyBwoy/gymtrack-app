//
//  EffortStubProvider.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 13.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Foundation

class EffortStubProvider: StubProvider {
  typealias Item = Effort

  let manager: DataProvider
  let date = Calendar.current.date(from: DateComponents(year: 2020, month: 2, day: 27, hour: 8, minute: 23))!

  let workout: Workout
  let exercise: Exercise

  required init(manager: DataProvider) {
    self.manager = manager
    
    workout = Workout(context: manager.context, date: date)
    exercise = Exercise(context: manager.context, name: "Test Squats", unit: .weight)
  }

  func one() -> Effort {
    Effort(context: manager.context,
           workout: workout,
           exercise: exercise,
           createdAt: date,
           value: 20,
           repeats: 10,
          failure: false)
  }
  
  func list() -> [Effort] {
    let calendar = Calendar.current
    return [
        Effort(context: manager.context, workout: workout, exercise: exercise, createdAt: date, value: 20, repeats: 20, failure: false),
        Effort(context: manager.context, workout: workout, exercise: exercise, createdAt: calendar.date(byAdding: .minute, value: 2, to: date)!, value: 30, repeats: 15, failure: false),
        Effort(context: manager.context, workout: workout, exercise: exercise, createdAt: calendar.date(byAdding: .minute, value: 4, to: date)!, value: 40, repeats: 12, failure: false),
        Effort(context: manager.context, workout: workout, exercise: exercise, createdAt: calendar.date(byAdding: .minute, value: 10, to: date)!, value: 60, repeats: 10, failure: false),
        Effort(context: manager.context, workout: workout, exercise: exercise, createdAt: calendar.date(byAdding: .minute, value: 5, to: date)!, value: 50, repeats: 12, failure: false),
        Effort(context: manager.context, workout: workout, exercise: exercise, createdAt: calendar.date(byAdding: .minute, value: 15, to: date)!, value: 70, repeats: 8, failure: false),
        Effort(context: manager.context, workout: workout, exercise: exercise, createdAt: calendar.date(byAdding: .minute, value: 20, to: date)!, value: 80, repeats: 6, failure: true),
    ]
  }
  
}
