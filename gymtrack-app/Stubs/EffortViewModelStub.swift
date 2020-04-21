//
//  EffortViewModelStub.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit


struct EffortViewModelStub: ViewModelStub {
  func detail() -> EffortViewModel {
    EffortViewModel(
      id: "1",
      createdAt: Date(),
      value: 20,
      repeats: 10,
      failure: false)
  }

  func list() -> [EffortViewModel] {
    let date = Date()
    let calendar = Calendar.current

    return [
      EffortViewModel(
        id: "1",
        createdAt: date,
        value: 20,
        repeats: 20,
        failure: false),
      EffortViewModel(
        id: "2",
        createdAt: calendar.date(byAdding: .minute, value: 2, to: date)!,
        value: 30,
        repeats: 15,
        failure: false),
      EffortViewModel(
        id: "3",
        createdAt: calendar.date(byAdding: .minute, value: 4, to: date)!,
        value: 40,
        repeats: 12,
        failure: false),
      EffortViewModel(
        id: "4",
        createdAt: calendar.date(byAdding: .minute, value: 5, to: date)!,
        value: 50,
        repeats: 12,
        failure: false),
      EffortViewModel(
        id: "5",
        createdAt: calendar.date(byAdding: .minute, value: 10, to: date)!,
        value: 60,
        repeats: 10,
        failure: false),
      EffortViewModel(
        id: "6",
        createdAt: calendar.date(byAdding: .minute, value: 15, to: date)!,
        value: 70,
        repeats: 8,
        failure: false),
      EffortViewModel(
        id: "7",
        createdAt: calendar.date(byAdding: .minute, value: 20, to: date)!,
        value: 80,
        repeats: 6,
        failure: true),
    ]
  }
  
  func list(workoutsCount: Int, itemsPerDay: Int, valueRange: Range<Double>) -> [EffortViewModel] {
    var result = [EffortViewModel]()
    let calendar = Calendar.current
    var date = Date()

    for i in 0 ..< workoutsCount {
      for j in 0 ..< itemsPerDay {
        let effort = EffortViewModel(
          id: "\(i)-\(j)",
          createdAt: date,
          value: Double.random(in: valueRange),
          repeats: Int.random(in: 10 ... 15),
          failure: false)
        result.append(effort)
      }

      date = calendar.date(byAdding: .day, value: 3, to: date)!
    }
    
    return result
  }
}
