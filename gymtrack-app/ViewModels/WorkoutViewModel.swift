//
//  WorkoutViewModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit

struct WorkoutViewModel: ViewModel {
  var id: String
  var date: Date
  var workoutexercises: [WorkoutExerciseViewModel]
  var categories: [CategoryViewModel]
  
  init(id: String, date: Date, workoutexercises: [WorkoutExerciseViewModel], categories: [CategoryViewModel]) {
    self.id = id
    self.date = date
    self.workoutexercises = workoutexercises
    
    var seen: [String: Bool] = [:]
    self.categories = categories.filter { seen.updateValue(true, forKey: $0.id) == nil }
  }
}
