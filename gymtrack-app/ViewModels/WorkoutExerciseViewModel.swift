//
//  WorkoutExerciseViewModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 22.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

class WorkoutExerciseViewModel: ViewModel, ObservableObject {
  @Published var id: String
  @Published var exercise: ExerciseViewModel
  @Published var efforts: [EffortViewModel]
  
  init(id: String, exercise: ExerciseViewModel, efforts: [EffortViewModel]) {
    self.id = id
    self.exercise = exercise
    self.efforts = efforts
  }
}
