//
//  ExerciseViewModelStub.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit

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
    let effortStub = EffortViewModelStub()
    
    let effortList = effortStub.list(workoutsCount: 20, itemsPerDay: 4, valueRange: 50..<90)

    return [
      ExerciseViewModel(
        id: "1",
        name: "Back Squats",
        unit: ExerciseViewModel.Unit.weight,
        categories: [categories[0]],
        efforts: effortList
      ),
      ExerciseViewModel(
        id: "4",
        name: "Chin-ups",
        unit: ExerciseViewModel.Unit.step,
        categories: Array(categories[2...4]),
        efforts: effortList
      ),
      ExerciseViewModel(
        id: "2",
        name: "Front Squats",
        unit: ExerciseViewModel.Unit.weight,
        categories: [categories[3]],
        efforts: effortList
      ),
      ExerciseViewModel(
        id: "3",
        name: "Deadlift",
        unit: ExerciseViewModel.Unit.weight,
        categories: [categories[1]],
        efforts: effortList
      ),
      ExerciseViewModel(
        id: "5",
        name: "Bench Press",
        unit: ExerciseViewModel.Unit.weight,
        categories: [categories[2]],
        efforts: effortList
      ),
    ]
  }
}
