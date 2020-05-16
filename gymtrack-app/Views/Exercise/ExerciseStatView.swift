//
//  ExerciseStatView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 17.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate struct ExerciseStatItemView: View {
  var label: Text
  var value: Text
  var unit: ExerciseUnit
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      label.font(.callout)
      HStack(alignment: .bottom) {
        value.font(.headline)
        Text(unit.rawValue)
      }
    }
  }
}

struct ExerciseStatView: View {
  var stat: ExerciseStat
  var unit: ExerciseUnit

  var body: some View {
    HStack(alignment: .top, spacing: 8) {
      ExerciseStatItemView(
        label: Text("Best"),
        value: Text("\(stat.best, specifier: "%.2f")"),
        unit: unit)

      Divider()

      ExerciseStatItemView(
        label: Text("Average"),
        value: Text("\(stat.average, specifier: "%.2f")"),
        unit: unit)
    }
  }
}

struct ExerciseStatView_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = ExerciseStubProvider(manager: manager)
    let exercise = stubProvider.one()
    
    manager.save()

    return ExerciseStatView(
      stat: exercise.stat(),
      unit: exercise.unit
    )
  }
}
