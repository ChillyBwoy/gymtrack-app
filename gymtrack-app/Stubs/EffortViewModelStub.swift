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
      EffortViewModel(id: "1", createdAt: date, value: 20, repeats: 20, failure: false),
      EffortViewModel(id: "2", createdAt: calendar.date(byAdding: .minute, value: 2, to: date)!, value: 30, repeats: 15, failure: false),
      EffortViewModel(id: "3", createdAt: calendar.date(byAdding: .minute, value: 4, to: date)!, value: 40, repeats: 12, failure: false),
      EffortViewModel(id: "4", createdAt: calendar.date(byAdding: .minute, value: 5, to: date)!, value: 50, repeats: 12, failure: false),
      EffortViewModel(id: "5", createdAt: calendar.date(byAdding: .minute, value: 10, to: date)!, value: 60, repeats: 10, failure: false),
      EffortViewModel(id: "6", createdAt: calendar.date(byAdding: .minute, value: 15, to: date)!, value: 70, repeats: 8, failure: false),
      EffortViewModel(id: "7", createdAt: calendar.date(byAdding: .minute, value: 20, to: date)!, value: 80, repeats: 6, failure: true),
    ]
  }
  
  func listForExercise() -> [EffortViewModel] {
    let calendar = Calendar.current
    var result: [EffortViewModel] = []
    var date = calendar.date(from: DateComponents(year: 2020, month: 2, day: 27, hour: 8, minute: 0)) ?? Date()

    result.append(contentsOf: [
      EffortViewModel(id: "1-1", createdAt: date, value: 20, repeats: 20, failure: false),
      EffortViewModel(id: "1-2", createdAt: calendar.date(byAdding: .minute, value: 2, to: date)!, value: 50, repeats: 12, failure: false),
      EffortViewModel(id: "1-3", createdAt: calendar.date(byAdding: .minute, value: 4, to: date)!, value: 60, repeats: 12, failure: false),
      EffortViewModel(id: "1-4", createdAt: calendar.date(byAdding: .minute, value: 6, to: date)!, value: 70, repeats: 10, failure: false),
      EffortViewModel(id: "1-5", createdAt: calendar.date(byAdding: .minute, value: 8, to: date)!, value: 80, repeats: 10, failure: false),
      EffortViewModel(id: "1-6", createdAt: calendar.date(byAdding: .minute, value: 10, to: date)!, value: 90, repeats: 8, failure: false),
    ])

    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 3, to: date)!
    result.append(contentsOf: [
      EffortViewModel(id: "2-1", createdAt: calendar.date(byAdding: .minute, value: 12, to: date)!, value: 40, repeats: 20, failure: false),
      EffortViewModel(id: "2-2", createdAt: calendar.date(byAdding: .minute, value: 14, to: date)!, value: 60, repeats: 12, failure: false),
      EffortViewModel(id: "2-3", createdAt: calendar.date(byAdding: .minute, value: 16, to: date)!, value: 60, repeats: 12, failure: false),
      EffortViewModel(id: "2-4", createdAt: calendar.date(byAdding: .minute, value: 18, to: date)!, value: 80, repeats: 10, failure: false),
      EffortViewModel(id: "2-5", createdAt: calendar.date(byAdding: .minute, value: 20, to: date)!, value: 80, repeats: 10, failure: true),
      EffortViewModel(id: "2-6", createdAt: calendar.date(byAdding: .minute, value: 22, to: date)!, value: 90, repeats: 8, failure: false),
    ])
    
    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 5, to: date)!
    result.append(contentsOf: [
      EffortViewModel(id: "3-1", createdAt: calendar.date(byAdding: .minute, value: 24, to: date)!, value: 40, repeats: 20, failure: false),
      EffortViewModel(id: "3-2", createdAt: calendar.date(byAdding: .minute, value: 26, to: date)!, value: 50, repeats: 12, failure: false),
      EffortViewModel(id: "3-3", createdAt: calendar.date(byAdding: .minute, value: 28, to: date)!, value: 60, repeats: 12, failure: false),
      EffortViewModel(id: "3-4", createdAt: calendar.date(byAdding: .minute, value: 30, to: date)!, value: 70, repeats: 10, failure: false),
      EffortViewModel(id: "3-5", createdAt: calendar.date(byAdding: .minute, value: 32, to: date)!, value: 80, repeats: 10, failure: false),
      EffortViewModel(id: "3-6", createdAt: calendar.date(byAdding: .minute, value: 34, to: date)!, value: 90, repeats: 8, failure: true),
    ])
    
    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 2, to: date)!
    result.append(contentsOf: [
      EffortViewModel(id: "4-1", createdAt: calendar.date(byAdding: .minute, value: 36, to: date)!, value: 40, repeats: 20, failure: false),
      EffortViewModel(id: "4-2", createdAt: calendar.date(byAdding: .minute, value: 38, to: date)!, value: 50, repeats: 12, failure: false),
      EffortViewModel(id: "4-3", createdAt: calendar.date(byAdding: .minute, value: 40, to: date)!, value: 60, repeats: 12, failure: false),
      EffortViewModel(id: "4-4", createdAt: calendar.date(byAdding: .minute, value: 42, to: date)!, value: 70, repeats: 10, failure: false),
      EffortViewModel(id: "4-5", createdAt: calendar.date(byAdding: .minute, value: 44, to: date)!, value: 80, repeats: 10, failure: false),
      EffortViewModel(id: "4-6", createdAt: calendar.date(byAdding: .minute, value: 46, to: date)!, value: 90, repeats: 8, failure: false),
    ])
    
    date = calendar.date(bySetting: .hour, value: 8, of: date)!
    date = calendar.date(byAdding: .day, value: 5, to: date)!
    result.append(contentsOf: [
      EffortViewModel(id: "5-1", createdAt: calendar.date(byAdding: .minute, value: 48, to: date)!, value: 40, repeats: 20, failure: false),
      EffortViewModel(id: "5-2", createdAt: calendar.date(byAdding: .minute, value: 50, to: date)!, value: 50, repeats: 12, failure: false),
      EffortViewModel(id: "5-3", createdAt: calendar.date(byAdding: .minute, value: 52, to: date)!, value: 60, repeats: 12, failure: false),
      EffortViewModel(id: "5-4", createdAt: calendar.date(byAdding: .minute, value: 54, to: date)!, value: 70, repeats: 10, failure: false),
      EffortViewModel(id: "5-5", createdAt: calendar.date(byAdding: .minute, value: 56, to: date)!, value: 80, repeats: 10, failure: false),
      EffortViewModel(id: "5-6", createdAt: calendar.date(byAdding: .minute, value: 58, to: date)!, value: 90, repeats: 8, failure: false),
    ])

    return result
  }
}
