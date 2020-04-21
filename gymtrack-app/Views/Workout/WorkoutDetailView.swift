//
//  WorkoutListView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate enum WorkoutDetailGroupBy: String, CaseIterable {
  case byExercise = "Exercise"
  case byTime = "Time"
}

struct WorkoutDetailView: View {
  var workout: WorkoutViewModel
  @State private var opened = [String]()
  @State private var groupBy: WorkoutDetailGroupBy = .byExercise
  
  private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
  }()

  private func onExerciseTap(_ id: String) {
    if opened.contains(id) {
      opened = opened.filter { $0 != id }
    } else {
      opened.append(id)
    }
  }

  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        ScrollView(.vertical, showsIndicators: false) {
          Picker(selection: $groupBy, label: Text("Group efforts by")) {
            ForEach(WorkoutDetailGroupBy.allCases, id: \.self) { type in
              Text("\(type.rawValue)").tag(type)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          .padding()
          ForEach(workout.workoutexercises, id: \.id) { workoutExercise in
            WorkoutExerciseDetailView(
              workoutExercise: workoutExercise,
              isOpen: self.opened.contains(workoutExercise.id)
            )
            .padding(5)
            .onTapGesture {
              withAnimation {
                self.onExerciseTap(workoutExercise.id)
              }
            }
          }
        }
      }
      .padding(.horizontal, 10)
      .navigationBarTitle(Text("\(workout.date, formatter: dateFormatter)"))
      .navigationBarItems(trailing: Button(action: {
        
      }) {
        Image(systemName: "plus")
      })
    }
  }
}

struct WorkoutDetailView_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutDetailView(workout: WorkoutViewModelStub().detail())
  }
}
