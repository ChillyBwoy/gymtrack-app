//
//  WorkoutExerciseViewModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 22.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

struct WorkoutExerciseViewModel: ViewModel {
  var id: String
  var exercise: ExerciseViewModel
  var efforts: [EffortViewModel]
}
