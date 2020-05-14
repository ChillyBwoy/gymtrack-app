//
//  ExerciseList.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 17.02.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate enum ExerciseListViewMode: String, CaseIterable {
  case none = "All By Name"
  case groupByCategory = "Group by Category"
}

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

fileprivate struct ExerciseListItemView: View {
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

struct ExerciseListView: View {
  var items: [Exercise]
  @State private var viewMode: ExerciseListViewMode = .none

  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        Picker(selection: $viewMode, label: Text("show as")) {
          ForEach(ExerciseListViewMode.allCases, id: \.self) { type in
            Text("\(type.rawValue)").tag(type)
          }
        }
          .pickerStyle(SegmentedPickerStyle())
          .padding()

        List {
          Section {
            ForEach(items, id: \.id) { exercise in
              NavigationLink(
                destination: ExerciseDetailView(exercise: exercise)
              ) {
                ExerciseListItemView(exercise: exercise)
              }
            }
          }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
      }.navigationBarTitle(Text("Exercises"))
    }
  }
}

struct ExerciseListView_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = ExerciseStubProvider(manager: manager)
    let exercises = stubProvider.list()
    
    manager.save()

    return ExerciseListView(items: exercises)
  }
}
