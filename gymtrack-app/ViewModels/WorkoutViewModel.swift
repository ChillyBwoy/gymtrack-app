//
//  WorkoutViewModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

class WorkoutViewModel: ViewModel, ObservableObject {
  @Published var id: String
  @Published var date: Date
  @Published var workoutexercises: [WorkoutExerciseViewModel]
  @Published var categories: [CategoryViewModel]

  init(id: String, date: Date, workoutexercises: [WorkoutExerciseViewModel], categories: [CategoryViewModel]) {
    self.id = id
    self.date = date
    self.workoutexercises = workoutexercises
    
    var seen: [String: Bool] = [:]
    self.categories = categories.filter { seen.updateValue(true, forKey: $0.id) == nil }
  }
}

extension WorkoutViewModel {
  func categoriesByExercies() -> [CategoryViewModel: Double] {
    var total = 0

    let result = workoutexercises.reduce(into: [:], { (acc: inout [CategoryViewModel: Int], workoutExercise) in
      for category in workoutExercise.exercise.categories {
        let count = acc[category] ?? 0
        acc.updateValue(count + 1, forKey: category)
        total += 1
      }
    })
    
    return result.reduce(into: [:]) { (acc: inout [CategoryViewModel: Double], item) in
      let (key, value) = item
      acc[key] = Double(value) / Double(total)
    }
  }
}
