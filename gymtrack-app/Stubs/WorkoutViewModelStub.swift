//
//  WorkoutViewModelStub.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit

struct WorkoutExerciseViewModelStub: ViewModelStub {
  let exerciseViewModelStub = ExerciseViewModelStub()
  let effortViewModelStub = EffortViewModelStub()

  func detail() -> WorkoutExerciseViewModel {
    return WorkoutExerciseViewModel(
      id: "1",
      exercise: exerciseViewModelStub.detail(),
      efforts: effortViewModelStub.list())
  }

  func list() -> [WorkoutExerciseViewModel] {
    exerciseViewModelStub.list().enumerated().map { (index, exercise) in
      WorkoutExerciseViewModel(
        id: "\(index)",
        exercise: exercise,
        efforts: effortViewModelStub.list(workoutsCount: 1, itemsPerDay: 7, valueRange: 8..<12))
    }
  }
}

struct WorkoutViewModelStub: ViewModelStub {
  func detail() -> WorkoutViewModel {
    let date = Date()
    return WorkoutViewModel(
      id: "1",
      date: date,
      workoutexercises: WorkoutExerciseViewModelStub().list())
  }

  func list() -> [WorkoutViewModel] {
    return []
  }
}
