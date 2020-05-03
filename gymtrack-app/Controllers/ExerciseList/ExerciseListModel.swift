//
//  ExerciseListModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

protocol ExerciseListModel: ObservableObject {
  var items: [ExerciseViewModel] { get set }
  
  func fetch() -> Void
}

final class ExerciseListDataModel: ObservableObject, ExerciseListModel {
  @Published var items: [ExerciseViewModel] = []
  
  func fetch() {}
}

final class ExerciseListDataModel_Previews: ObservableObject, ExerciseListModel {
  @Published var items: [ExerciseViewModel] = []
  
  func fetch() {
    self.items = ExerciseViewModelStub().list()
  }
}
