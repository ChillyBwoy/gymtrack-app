//
//  ExerciseViewModelStub.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

struct ExerciseViewModelStub: ViewModelStub {
  func detail() -> ExerciseViewModel {
    let categoryStub = CategoryViewModelStub()
    let categories = Array(categoryStub.list()[0...2])

    return ExerciseViewModel(
      id: "1",
      name: "Back Squats",
      unit: ExerciseViewModel.Unit.weight,
      categories: categories)
  }
  
  func list() -> [ExerciseViewModel] {
    let categoryStub = CategoryViewModelStub()
    let categories = categoryStub.list()

    return [
      ExerciseViewModel(
        id: "1",
        name: "Back Squats",
        unit: ExerciseViewModel.Unit.weight,
        categories: [categories[0]]),
      ExerciseViewModel(
        id: "4",
        name: "Chin-ups",
        unit: ExerciseViewModel.Unit.step,
        categories: Array(categories[0...2])),
      ExerciseViewModel(
        id: "2",
        name: "Front Squats",
        unit: ExerciseViewModel.Unit.weight,
        categories: [categories[0]]),
      ExerciseViewModel(
        id: "3",
        name: "Deadlift",
        unit: ExerciseViewModel.Unit.weight,
        categories: [categories[1]]),
      ExerciseViewModel(
        id: "5",
        name: "Bench Press",
        unit: ExerciseViewModel.Unit.weight,
        categories: [categories[2]]),
      ExerciseViewModel(
        id: "6",
        name: "Running",
        unit: ExerciseViewModel.Unit.distance,
        categories: Array(categories[2...4])),
      ExerciseViewModel(
        id: "7",
        name: "Abs",
        unit: ExerciseViewModel.Unit.check,
        categories: Array(categories[4...6])),
    ]
  }
}
