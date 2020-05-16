//
//  ExerciseList.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 17.02.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate struct ExerciseListLabelView: View {
  var unit: ExerciseUnit
  var label: String
  var value: Double

  var body: some View {
    VStack(alignment: .leading) {
      Text(label).font(.caption)
      Text("\(value, specifier: "%.2f")").font(.caption)
    }
  }
}

struct ExerciseListItemView: View {
  let exercise: Exercise
  let stat: ExerciseStat
  
  init(exercise: Exercise) {
    self.exercise = exercise
    self.stat = exercise.stat()
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(exercise.name)
        .lineLimit(nil)
      HStack {
        ExerciseListLabelView(unit: exercise.unit, label: "Best", value: stat.best)
        ExerciseListLabelView(unit: exercise.unit, label: "Avg", value: stat.average)
      }
    }
  }
}

struct ExerciseListItemView_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = ExerciseStubProvider(manager: manager)
    let exercise = stubProvider.one()
    
    manager.save()

    return List {
      ExerciseListItemView(exercise: exercise)
    }
  }
}
