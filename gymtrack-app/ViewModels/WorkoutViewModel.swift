//
//  WorkoutViewModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit

struct WorkoutExerciseViewModel: ViewModel {
  var id: String
  var exercise: ExerciseViewModel
  var efforts: [EffortViewModel]
}

struct WorkoutViewModel: ViewModel {
  var id: String
  var date: Date
  var workoutexercises: [WorkoutExerciseViewModel]
}
