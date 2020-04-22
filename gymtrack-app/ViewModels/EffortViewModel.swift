//
//  EffortViewModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

class EffortViewModel: ViewModel, ObservableObject {
  @Published var id: String
  @Published var createdAt: Date
  @Published var value: Double
  @Published var repeats: Int
  @Published var failure: Bool
  
  init(id: String, createdAt: Date, value: Double, repeats: Int, failure: Bool) {
    self.id = id
    self.createdAt = createdAt
    self.value = value
    self.repeats = repeats
    self.failure = failure
  }
}
