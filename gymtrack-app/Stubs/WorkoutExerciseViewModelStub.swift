//
//  WorkoutExerciseViewModelStub.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 22.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

struct WorkoutExerciseViewModelStub: ViewModelStub {
  private let exerciseStub = ExerciseViewModelStub()
  private let effortStub = EffortViewModelStub()

  func detail() -> WorkoutExerciseViewModel {
    return WorkoutExerciseViewModel(
      id: "1",
      exercise: exerciseStub.detail(),
      efforts: effortStub.list())
  }

  func list() -> [WorkoutExerciseViewModel] {
    exerciseStub.list().enumerated().map { (index, exercise) in
      WorkoutExerciseViewModel(
        id: "\(index)",
        exercise: exercise,
        efforts: Array(exercise.efforts[0...6]))
    }
  }
}
