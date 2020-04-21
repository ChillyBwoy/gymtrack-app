//
//  ViewModels.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

struct ExerciseViewModel: ViewModel {
  var id: String
  var name: String
  var categories: [CategoryViewModel]
  var efforts: [EffortViewModel]
  var unit: Unit
  
  init(id: String, name: String, unit: Unit, categories: [CategoryViewModel], efforts: [EffortViewModel] = []) {
    self.id = id
    self.name = name
    self.unit = unit
    self.categories = categories
    self.efforts = efforts
  }
  
  enum Unit: String, CaseIterable {
    case none
    case weight
    case time
    case step
    case distance
    case check
  }
}

extension ExerciseViewModel {
  private static let unitMap: [ExerciseUnit: ExerciseViewModel.Unit] = [
    .none: .none,
    .weight: .weight,
    .time: .time,
    .step: .step,
    .distance: .distance,
    .check: .check
  ]

  init(id: String, name: String, unit: ExerciseUnit, categories: [CategoryViewModel], efforts: [EffortViewModel] = []) {
    self.id = id
    self.name = name
    self.categories = categories
    self.efforts = efforts
    self.unit = {
      if let newUnit = ExerciseViewModel.unitMap[unit] {
        return newUnit
      }

      return .none
    }()
  }
}
