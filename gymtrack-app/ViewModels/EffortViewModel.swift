//
//  EffortViewModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit

struct EffortViewModel: ViewModel {
  var id: String
  var createdAt: Date
  var value: Double
  var repeats: Int
  var failure: Bool
}
