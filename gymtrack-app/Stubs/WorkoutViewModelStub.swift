//
//  WorkoutViewModelStub.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit

struct WorkoutViewModelStub: ViewModelStub {
  private let workoutExerciseStub = WorkoutExerciseViewModelStub()
  
  func detail() -> WorkoutViewModel {
    let date = Date()
    let workoutexercises = workoutExerciseStub.list()
    let categories: [CategoryViewModel] = workoutexercises.reduce([], { acc, we  in
      acc + we.exercise.categories
    })

    return WorkoutViewModel(
      id: "1",
      date: date,
      workoutexercises: workoutexercises,
      categories: categories
    )
  }

  func list() -> [WorkoutViewModel] {
    return []
  }
}
