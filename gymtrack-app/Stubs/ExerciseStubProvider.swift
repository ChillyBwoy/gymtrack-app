//
//  ExerciseStubProvider.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 04.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Foundation

class ExerciseStubProvider: StubProvider {
  typealias Item = Exercise
  
  func one(manager: DataProvider) -> Exercise {
    let entity = Exercise.create(with: manager.context, name: "Back Squats", unit: .weight)
    entity.addToCategories([
      Category.create(with: manager.context, name: "Arms", color: .red),
      Category.create(with: manager.context, name: "Spin", color: .indigo),
      Category.create(with: manager.context, name: "Legs", color: .blue)
    ])
    return entity
  }
}
