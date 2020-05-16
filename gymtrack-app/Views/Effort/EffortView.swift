//
//  EffortView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 17.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate let weightFormatter: MassFormatter = {
  let formatter = MassFormatter()
  return formatter
}()

fileprivate let timeFormatter: DateComponentsFormatter = {
  let formatter = DateComponentsFormatter()
  formatter.unitsStyle = .short
  formatter.allowedUnits = [.minute, .second]
  return formatter
}()

fileprivate let distanceFormatter: LengthFormatter = {
  let formatter = LengthFormatter()
  formatter.unitStyle = .medium
  return formatter
}()

struct EffortView: View {
  var effort: Effort

  var body: some View {
    switch effort.exercise.unit {
    case .none:
      return AnyView(Text(""))
    case .weight:
      return AnyView(Text(weightFormatter.string(fromValue: effort.value, unit: .kilogram)))
    case .time:
      return AnyView(Text(timeFormatter.string(from: effort.value) ?? ""))
    case .step:
      return AnyView(Text("\(effort.value, specifier: "%.0f")"))
    case .check:
      return AnyView(Image(systemName: "checkmark.circle.fill"))
    case .distance:
      return AnyView(Text(distanceFormatter.string(fromValue: effort.value, unit: .kilometer)))
    }
  }
}

struct EffortView_Previews: PreviewProvider {
    static var previews: some View {
      let manager = DataManagerMemory()
      var efforts: [Effort] = []
      let date = Calendar.current.date(from: DateComponents(year: 2020, month: 2, day: 27))!
      
      let workout = Workout(context: manager.context, date: date)

      for unit in ExerciseUnit.allCases {
        let exercise = Exercise(context: manager.context, name: "Test", unit: unit)
        let newEffort = Effort(context: manager.context,
               workout: workout,
               exercise: exercise,
               createdAt: date,
               value: 75,
               repeats: 10,
               failure: false)
        efforts.append(newEffort)
      }
      
      manager.save()
      
      return Group {
        ForEach(efforts, id: \.self) { effort in
          EffortView(effort: effort)
        }
      }
      .previewLayout(.fixed(width: 240, height: 30))
    }
}
