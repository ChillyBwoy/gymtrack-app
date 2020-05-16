//
//  WorkoutExerciseListView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct WorkoutExerciseListView: View {
  let workout: Workout
  let effortsByExercises: [(Exercise, [Effort])]
  @State private var activeItems = [UUID]()

  init(workout: Workout) {
    self.workout = workout
    self.effortsByExercises = workout.effortsByExercises()
  }

  private func onExerciseTap(_ id: UUID) {
    if activeItems.contains(id) {
      activeItems = activeItems.filter { $0 != id }
    } else {
      activeItems.append(id)
    }
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      ForEach(effortsByExercises, id: \.0.id) { (exercise, efforts) in
        WorkoutExerciseEffortsView(
          exercise: exercise,
          efforts: efforts,
          isOpen: self.activeItems.contains(exercise.id))
        .padding(5)
        .onTapGesture {
          withAnimation {
            self.onExerciseTap(exercise.id)
          }
        }
      }
    }
  }
}

struct WorkoutExerciseListView_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = WorkoutStubProvider(manager: manager)
    let workout = stubProvider.one()
    
    manager.save()

    return WorkoutExerciseListView(workout: workout)
  }
}
