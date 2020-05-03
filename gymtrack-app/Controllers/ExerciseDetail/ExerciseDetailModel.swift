//
//  ExerciseDetailModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

protocol ExerciseDetailModel: ObservableObject {
  var exercise: ExerciseViewModel? { get set }

  func fetch(id: String) -> Void
}

final class ExerciseDetailDataModel: ExerciseDetailModel, ObservableObject {
  @Published var exercise: ExerciseViewModel? = nil
  
  func fetch(id: String) {}
}

final class ExerciseDetailDataModel_Previews: ExerciseDetailModel, ObservableObject {
  @Published var exercise: ExerciseViewModel? = nil
  
  func fetch(id: String) {
    exercise = ExerciseViewModelStub().detail()
  }
}
