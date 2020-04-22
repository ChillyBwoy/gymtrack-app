//
//  ViewModels.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

class ExerciseViewModel: ViewModel, ObservableObject {
  @Published var id: String
  @Published var name: String
  @Published var categories: [CategoryViewModel]
  @Published var efforts: [EffortViewModel]
  @Published var unit: Unit

  init(
    id: String,
    name: String,
    unit: Unit,
    categories: [CategoryViewModel] = [],
    efforts: [EffortViewModel] = [])
  {
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
  func groupEffortsByDate() -> [Date: [EffortViewModel]] {
    let calendar = Calendar.current

    let groups = efforts.reduce(into: [:], { ( acc: inout [Date: [EffortViewModel]], effort) in
      let components = calendar.dateComponents([.year, .month, .day], from: effort.createdAt)
      let key = calendar.date(from: components)!
      var currList = acc[key] ?? []
      currList.append(effort)
      acc.updateValue(currList, forKey: key)
    })
    
    return groups
  }
}

/**
 * Graphql Types support
 */
extension ExerciseViewModel {
  private static let unitMap: [ExerciseUnit: ExerciseViewModel.Unit] = [
    .none: .none,
    .weight: .weight,
    .time: .time,
    .step: .step,
    .distance: .distance,
    .check: .check
  ]

  convenience init(
    id: String,
    name: String,
    unit: ExerciseUnit,
    categories: [CategoryViewModel] = [],
    efforts: [EffortViewModel] = []
  ) {
    let newUnit: ExerciseViewModel.Unit = {
      if let newUnit = ExerciseViewModel.unitMap[unit] {
        return newUnit
      }
      return .none
    }()

    self.init(id: id, name: name, unit: newUnit, categories: categories, efforts: efforts)
  }
}
