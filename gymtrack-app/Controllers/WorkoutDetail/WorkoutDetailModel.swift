//
//  WorkoutDetailModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

protocol WorkoutDetailModel: ObservableObject {
  var workout: WorkoutViewModel? { get set }
  func fetch(id: String) -> Void
}

final class WorkoutDetailDataModel: ObservableObject, WorkoutDetailModel {
  @Published var workout: WorkoutViewModel? = nil

  func fetch(id: String) {
  }
}

final class WorkoutDetailDataModel_Previews: ObservableObject, WorkoutDetailModel {
  @Published var workout: WorkoutViewModel? = nil

  func fetch(id: String) {
    self.workout = WorkoutViewModelStub().detail()
  }
}
