//
//  WorkoutDetailContainer.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate enum WorkoutDetailGroupBy: String, CaseIterable {
  case byExercise = "Exercise"
  case byTime = "Time"
  case byCategory = "Category"
}

struct WorkoutDetail<Model>: View where Model: WorkoutDetailModel {
  @ObservedObject var model: Model
  var id: String
  @State private var groupBy: WorkoutDetailGroupBy = .byExercise

  private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
  }()

  private func fetch() {
    model.fetch(id: id)
  }

  var body: some View {
    NavigationView {
      if model.workout != nil {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .leading, spacing: 20) {
            Picker(selection: $groupBy, label: Text("Group efforts by")) {
              ForEach(WorkoutDetailGroupBy.allCases, id: \.self) { type in
                Text("\(type.rawValue)").tag(type)
              }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 5)
            
            WorkoutCategoriesView(workout: model.workout!)
              .padding(.horizontal, 8)
            WorkoutExerciseListView(items: model.workout!.workoutexercises)
          }
        }
        .padding(.horizontal, 10)
        .navigationBarTitle(Text("\(model.workout!.date, formatter: self.dateFormatter)"))
        .navigationBarItems(trailing: Button(action: {
          print("Add")
        }) {
          Image(systemName: "plus")
        })
      } else {
        Text("Loading...")
      }
    }.onAppear(perform: fetch)
  }
}

struct WorkoutDetail_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WorkoutDetail(
        model: WorkoutDetailDataModel_Previews(),
        id: "some-test-id")
      .colorScheme(.light)
      WorkoutDetail(
        model: WorkoutDetailDataModel_Previews(),
        id: "some-test-id")
      .colorScheme(.dark)
    }
  }
}
